class_name BattleHelper

var movesArray

func _init(moveArray):
	self.movesArray = moveArray

func processBattle():
	for i in range(7):
		if self.movesArray[i].isEnemy == 0:
			# If basic attack...
			if self.movesArray[i].move == 1:
				self.movesArray[i].target.enemyData.current_hp -= self.movesArray[i].source.attack_damage
				self.movesArray[i].target.updateHealth()
			# this statement checks if this is a skill move
			if self.movesArray[i].move == 2:
				# this statement checks if this is an attack skill move
				if self.movesArray[i].skill.type == 0:
					self.movesArray[i].target.enemyData.current_hp -= self.movesArray[i].skill.damage_cal
					self.movesArray[i].source.cur_hp -= self.movesArray[i].skill.hp_cost
					self.movesArray[i].source.cur_mp -= self.movesArray[i].skill.mp_cost
					self.movesArray[i].target.updateHealth()
				# this statement checks if this is a heal move
				if self.movesArray[i].skill.type == 1:
					self.movesArray[i].friendlyTarget.cur_hp += self.movesArray[i].skill.heal_cal
					self.movesArray[i].source.cur_hp -= self.movesArray[i].skill.hp_cost
					self.movesArray[i].source.cur_mp -= self.movesArray[i].skill.mp_cost
				# this statement checks if this is an buff move
				if self.movesArray[i].skill.type == 2:
					self.movesArray[i].friendlyTarget.cur_hp *= self.movesArray[i].skill.buff_value
					self.movesArray[i].source.cur_hp -= self.movesArray[i].skill.hp_cost
					self.movesArray[i].source.cur_mp -= self.movesArray[i].skill.mp_cost
				# this statement checks if this is a debuff move
				if self.movesArray[i].skill.type == -2:
					self.movesArray[i].target.enemyData.current_hp *= self.movesArray[i].skill.buff_value
					self.movesArray[i].source.cur_hp -= self.movesArray[i].skill.hp_cost
					self.movesArray[i].source.cur_mp -= self.movesArray[i].skill.mp_cost
					self.movesArray[i].target.updateHealth()
			if self.movesArray[i].move == 3:
				# Check if it is consumable item
				if self.movesArray[i].itemInUse.type == 0:
					self.movesArray[i].friendlyTarget.cur_hp += self.movesArray[i].itemInUse.hp_heal
				# Check if it is modifier itemd
				if self.movesArray[i].itemInUse.type == 1:
					self.movesArray[i].friendlyTarget.strength += self.movesArray[i].itemInUse.modify_strength
					self.movesArray[i].friendlyTarget.agility += self.movesArray[i].itemInUse.modify_agility
					self.movesArray[i].friendlyTarget.intelligence += self.movesArray[i].itemInUse.modify_intelligence
					print(self.movesArray[i].friendlyTarget.strength)
					print(self.movesArray[i].friendlyTarget.agility)
					print(self.movesArray[i].friendlyTarget.intelligence)
				# Check if it is an attack item
				if self.movesArray[i].itemInUse.type == 2:
					self.movesArray[i].target.enemyData.current_hp -= self.movesArray[i].itemInUse.damage
					self.movesArray[i].target.updateHealth()
		if self.movesArray[i].isEnemy == 1:
			self.movesArray[i].enemyTarget.cur_hp -= self.movesArray[i].enemySource.enemyData.damage

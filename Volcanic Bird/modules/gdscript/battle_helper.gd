class_name BattleHelper

var movesArray: Array
var numMoves: int

func _init(moveArray):
	self.movesArray = moveArray
	self.numMoves = len(self.movesArray)

func processBattle():
	for i in range(self.numMoves):
		var move = self.movesArray[i]
		if move.isEnemy == 0:
			handleFriendlyMove(move)
		if move.isEnemy == 1:
			handleEnemyMove(move)

func handleEnemyMove(move):
	move.enemyTarget.cur_hp -= move.enemySource.enemyData.damage

func handleFriendlyMove(move):
	if move.move == 1: 
		executeBasicAttack(move)
	elif move.move == 2: 
		executeSkill(move)
	elif move.move == 3:
		handleItem(move)

func handleItem(move):
	if move.itemInUse.type == 0:
		handleConsumableItem(move)
	if move.itemInUse.type == 1:
		handleModifierItem(move)
	if move.itemInUse.type == 2:
		handleAttackItem(move)

func handleConsumableItem(move):
	move.friendlyTarget.cur_hp += move.itemInUse.hp_heal

func handleModifierItem(move):
	move.friendlyTarget.strength += move.itemInUse.modify_strength
	move.friendlyTarget.agility += move.itemInUse.modify_agility
	move.friendlyTarget.intelligence += move.itemInUse.modify_intelligence
	
func handleAttackItem(move):
	move.target.enemyData.current_hp -= move.itemInUse.damage
	move.target.updateHealth()

func executeSkill(move):
	if move.skill.type == 0:
		handleAttackSkill(move)
	if move.skill.type == 1:
		handleHealSkill(move)
	# this statement checks if this is an buff move
	if move.skill.type == 2:
		handleBuffSkill(move)
	# this statement checks if this is a debuff move
	if move.skill.type == -2:
		move.target.enemyData.current_hp *= move.skill.buff_value
		move.source.cur_hp -= move.skill.hp_cost
		move.source.cur_mp -= move.skill.mp_cost
		move.target.updateHealth()

func handleBuffSkill(move):
	move.friendlyTarget.cur_hp *= move.skill.buff_value
	move.source.cur_hp -= move.skill.hp_cost
	move.source.cur_mp -= move.skill.mp_cost

func handleHealSkill(move):
	move.friendlyTarget.cur_hp += move.skill.heal_cal
	move.source.cur_hp -= move.skill.hp_cost
	move.source.cur_mp -= move.skill.mp_cost

func handleAttackSkill(move):
	move.target.enemyData.current_hp -= move.skill.damage_cal
	move.source.cur_hp -= move.skill.hp_cost
	move.source.cur_mp -= move.skill.mp_cost
	move.target.updateHealth()

func executeBasicAttack(move):
	move.target.enemyData.current_hp -= move.source.attack_damage
	move.target.updateHealth()
	

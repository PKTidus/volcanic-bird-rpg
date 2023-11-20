class_name Option

var option_title: String
var option_results: Array[OptionResult]

func _init(option_title, option_results):
	self.option_title = option_title
	
	var total_chance = 0
	var n_options = len(option_results)
	print("n_options: ", n_options)
	self.option_results = []
	for i in range(n_options):
		print(option_results[i].description)
		total_chance += option_results[i].chance
		self.option_results.append(option_results[i])
	assert(total_chance == 100)

func collapse():
	var num = self._getRand()
	var closest = INF
	var index = -1
	for i in range(len(self.option_results)):
		var option = option_results[i]
		var prox = abs(option.chance - num)
		if (prox < closest):
			closest = prox
			index = i 
	return option_results[index]
	
func _getRand():
	var rng = RandomNumberGenerator.new()
	return (rng.randi() % 100) + 1;

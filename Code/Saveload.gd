extends AnimatedSprite2D
var file
var rng =  RandomNumberGenerator.new()
var enemy_id
func _ready():
	file = FileAccess.open("res://save.data", FileAccess.READ)
	enemy_id = file.get_var()
	file.close()
	var enemy = load("res://Scenes/enemy"+ str(enemy_id[0]) +".tscn").instantiate()
	add_child(enemy)
	enemy.move_local_x(46)
	enemy.move_local_y(-12)
	if enemy_id.size() == 2:
		var enemy2 = load("res://Scenes/enemy"+ str(enemy_id[1]) +".tscn").instantiate()
		add_child(enemy2)
		enemy.name = "Enemy1"
		enemy2.name = "Enemy2"
		enemy.move_local_x(-10)
		enemy2.move_local_x(56)
		enemy2.move_local_y(-12)
		enemy2.spawned_extra = true

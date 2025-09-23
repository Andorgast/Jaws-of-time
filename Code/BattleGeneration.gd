extends AnimatedSprite2D
var file
var rng =  RandomNumberGenerator.new()
var enemy_id
var level
var enemyhp
var hp
var mana
func _ready():
	file = FileAccess.open("res://save.data", FileAccess.READ)
	file.get_var() #enemy id from previous battle, so not needed
	level = file.get_var()
	file.close()
	if level < 10:
		enemy_id = [round(rng.randf_range(0,3))]
		save_update()
		var enemy = load("res://Scenes/enemy"+ str(enemy_id[0]) +".tscn").instantiate()
		add_child(enemy)
		enemy.move_local_x(46)
		enemy.move_local_y(-12)
		if round(rng.randf_range(0, 1)) == 1:
			enemy_id.push_back(round(rng.randf_range(4,5)))
			var enemy2 = load("res://Scenes/enemy"+ str(enemy_id[1]) +".tscn").instantiate()
			add_child(enemy2)
			enemy.name = "Enemy1"
			enemy2.name = "Enemy2"
			enemy.move_local_x(-10)
			enemy2.move_local_x(56)
			enemy2.move_local_y(-12)
			enemy2.spawned_extra = true
			save_update()
func save_update():
	file = FileAccess.open("res://save.data", FileAccess.READ)
	level = level + 1
	file.get_var()
	enemyhp = file.get_var()
	hp = file.get_var()
	mana = file.get_var()
	file.close()
	file = FileAccess.open("res://save.data", FileAccess.WRITE)
	file.store_var(enemy_id)
	file.store_var(level)
	file.store_var(enemyhp)
	file.store_var(hp)
	file.store_var(mana)
	file.close()

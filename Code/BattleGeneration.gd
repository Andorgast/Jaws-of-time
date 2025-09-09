extends AnimatedSprite2D
var file
var rng =  RandomNumberGenerator.new()
var enemy_id
var level
var maxhp
var hp
func _ready():
	file = FileAccess.open("res://save.data", FileAccess.READ)
	file.get_var() #enemy id from previous battle, so not needed
	level = file.get_var()
	file.close()
	if level < 10:
		enemy_id = [round(rng.randf_range(0,5))]
		save_update()
		var enemy = load("res://Scenes/enemy"+ str(enemy_id[0]) +".tscn").instantiate()
		add_child(enemy)
func save_update():
	file = FileAccess.open("res://save.data", FileAccess.READ)
	level = level + 1
	file.get_var()
	file.get_var()
	maxhp = file.get_var()
	hp = file.get_var()
	file.close()
	file = FileAccess.open("res://save.data", FileAccess.WRITE)
	file.store_var(enemy_id)
	file.store_var(level)
	file.store_var(maxhp)
	file.store_var(hp)
	file.close()

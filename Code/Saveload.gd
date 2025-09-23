extends AnimatedSprite2D
var file
var rng =  RandomNumberGenerator.new()
var enemy_id
var buttonid
var texture
var texture1 = preload("res://Assets/button0.png")
var texture2 = preload("res://Assets/button1.png")
var texture3 = preload("res://Assets/button2.png")
var texture4 = preload("res://Assets/button3.png")
func _ready():
	file = FileAccess.open("res://attacks.data", FileAccess.READ)
	buttonid = file.get_var()
	file.close()
	preparetexture(0)
	$Attack/atk1.texture_normal = texture
	preparetexture(1)
	$Attack/atk2.texture_normal = texture
	preparetexture(2)
	$Attack/atk3.texture_normal = texture
	preparetexture(3)
	$Attack/atk4.texture_normal = texture
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
func preparetexture(toPrepare):
	if buttonid[toPrepare] == 0:
		texture = texture1
	elif buttonid[toPrepare] == 1:
		texture = texture2
	elif buttonid[toPrepare] == 2:
		texture = texture3
	elif buttonid[toPrepare] == 3:
		texture = texture4

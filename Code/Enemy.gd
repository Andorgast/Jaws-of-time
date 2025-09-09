extends AnimatedSprite2D
var health = 10
var rng =  RandomNumberGenerator.new()
var atk_1_id 
var atk_2_id 
var atk_3_id
var atk_damage = []
var damage
var effect = 0
signal attack_buddy
func _ready():
	$RichTextLabel.text = str(health)
	get_node("../Attack/atk1").pressed.connect(_on_atk_1_pressed)
	get_node("../Attack/atk2").pressed.connect(_on_atk_2_pressed)
	get_node("../Attack/atk3").pressed.connect(_on_atk_3_pressed)
func turnstart():
	var attackid = rng.randf_range(0, 100)
	if attackid <= 50:
		punch()
	elif attackid > 50:
		kick()
func _on_atk_1_pressed():
	take_damage(1)
func _on_atk_2_pressed():
	take_damage(2)
func _on_atk_3_pressed():
	take_damage(3)
func take_damage(atk):
	var file = FileAccess.open("res://attacks.data", FileAccess.READ)
	atk_1_id = file.get_var()
	atk_2_id = file.get_var()
	atk_3_id = file.get_var()
	atk_damage = file.get_var()
	print(atk_damage)
	if atk == 1:
		damage = atk_damage[atk_1_id]
	elif atk == 2:
		damage = atk_damage[atk_2_id]
	elif atk == 3:
		damage = atk_damage[atk_3_id]
	if (health - damage) <= 0:
		health = 0
		$RichTextLabel.text = str(health)
		file.close()
		die()
	else:
		health = health - damage
		$RichTextLabel.text = str(health)
		file.close()
		turnstart()
func punch():
	var punch_damage = 1
	emit_signal("attack_buddy", punch_damage, effect)
	print("punch")
	print(punch_damage)
func kick():
	var kick_damage = round(rng.randf_range(0,1))
	if round(rng.randf_range(0,1)) == 1:
		effect = 1
	print("kick")
	print(kick_damage)
	emit_signal("attack_buddy", kick_damage, effect)
func die():
	pass

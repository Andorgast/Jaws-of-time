extends AnimatedSprite2D
var health = 10
var rng =  RandomNumberGenerator.new()
var atk_1_id 
var atk_2_id 
var atk_3_id
var atk_damage
var atk_effect
var atk_type
var damage
var manacost
var effect = 0
signal attack_buddy
var mana
var buddyheal = 0
@onready var animations_buddy = get_node("../Litlle buddy")
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
	atk_effect = file.get_var()
	atk_type = file.get_var()
	manacost = file.get_var()
	file.close()
	file = FileAccess.open("res://save.data", FileAccess.READ)
	file.get_var()
	file.get_var()
	file.get_var()
	file.get_var()
	mana = file.get_var()
	file.close()
	if atk == 1:
		atk = atk_1_id
	elif atk == 2:
		atk = atk_2_id
	elif atk == 3:
		atk = atk_3_id
	if (mana >= manacost[atk]):
		mana = mana - manacost[atk]
		damage = atk_damage[atk]
		if (health - damage) <= 0:
			health = 0
			$RichTextLabel.text = str(health)
			die()
		elif atk == 3:
			buddyheal = damage
			saveredo()
			turnstart()
		else:
			health = health - damage
			$RichTextLabel.text = str(health)
			saveredo()
			turnstart()
	else:
		pass #attack whiff
		turnstart()
func punch():
	var punch_damage = 1
	emit_signal("attack_buddy", punch_damage, effect)
func kick():
	var kick_damage = round(rng.randf_range(0,1))
	if round(rng.randf_range(0,1)) == 1:
		effect = 1
	emit_signal("attack_buddy", kick_damage, effect)
func die():
	get_tree().change_scene_to_file("res://Scenes/Battle_template.tscn")
func saveredo():
	var file = FileAccess.open("res://save.data", FileAccess.READ)
	var enemy = file.get_var()
	var level = file.get_var()
	var maxhp = file.get_var()
	var hp = file.get_var()
	hp = hp - buddyheal
	buddyheal = 0
	file.close()
	file = FileAccess.open("res://save.data", FileAccess.WRITE)
	get_node("../RichTextLabel").text = str(mana)
	get_node("../Litlle buddy/RichTextLabel").text = str(hp)
	file.store_var(enemy)
	file.store_var(level)
	file.store_var(maxhp)
	file.store_var(hp)
	file.store_var(mana)
	file.close()

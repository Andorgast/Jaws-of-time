extends AnimatedSprite2D
var hp
signal skip_turn
var connected
var file
var mana
func _ready():
	play_backwards("die")
	await get_tree().create_timer(0.01).timeout
	file = FileAccess.open("res://save.data", FileAccess.READ)
	file.get_var()
	file.get_var()
	file.get_var()
	hp = file.get_var()
	mana = file.get_var()
	file.close()
	$RichTextLabel.text = str(hp)
	get_node("../RichTextLabel").text = str(mana)
func _physics_process(_delta):
	if !connected && (get_node_or_null("../Enemy1") != null) && (get_node_or_null("../Enemy2") != null):
		get_node("../Enemy1").attack_buddy.connect(_on_attacked)
		get_node("../Enemy2").attack_buddy.connect(_on_attacked)
		print("double yaaaay")
		connected = true
	elif !connected && (get_node_or_null("../Enemy") != null):
		get_node("../Enemy").attack_buddy.connect(_on_attacked)
		connected = true
func _on_attacked(dmg, _effect):
	if (hp - dmg) <= 0:
		hp = 0
		$RichTextLabel.text = str(hp)
		die()
	else:
		file = FileAccess.open("res://save.data", FileAccess.READ)
		var enemyid = file.get_var()
		var level = file.get_var()
		var maxhp = file.get_var()
		hp = file.get_var()
		mana = file.get_var()
		file.close()
		hp = hp - dmg
		$RichTextLabel.text = str(hp)
		file = FileAccess.open("res://save.data", FileAccess.WRITE)
		file.store_var(enemyid)
		file.store_var(level)
		file.store_var(maxhp)
		file.store_var(hp)
		file.store_var(mana)
		file.close()
#		if effect == 1:
#			emit_signal("skip_turn")
		if (hp - dmg) > hp:
			pass
		elif (hp - dmg) != hp:
			play("hurt")
			await animation_finished
			play_backwards("hurt")
func die():
	play("die")
	await animation_finished
	get_tree().change_scene_to_file("res://Scenes/FirstBattle.tscn")
func _on_cpu_particles_2d_finished():
	play_backwards("Flash")

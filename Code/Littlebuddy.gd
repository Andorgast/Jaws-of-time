extends AnimatedSprite2D
var hp
signal skip_turn
func _ready():
	var file = FileAccess.open("res://save.data", FileAccess.READ)
	file.get_var()
	file.get_var()
	file.get_var()
	hp =  file.get_var()
	file.close()
	$RichTextLabel.text = str(hp)
	get_node("../Enemy").attack_buddy.connect(_on_attacked)
func _on_attacked(dmg, effect):
	hp = hp - dmg
	$RichTextLabel.text = str(hp)
	if effect == 1:
		emit_signal("skip_turn")

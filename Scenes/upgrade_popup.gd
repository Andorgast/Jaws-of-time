extends AnimatedSprite2D
var mousefollow1
var mousefollow2
var mousefollow3
var closestspell
var distance = []
func _ready():
	pass
func _process(delta):
	if mousefollow1:
		$Og_1_spell.global_position = get_global_mouse_position()
	elif mousefollow2:
		$Og_2_spell.global_position = get_global_mouse_position()
	elif mousefollow3:
		$Og_3_spell.global_position = get_global_mouse_position()
func _on_button1_button_down():
	mousefollow1 = true
func _on_button1_button_up():
	mousefollow1 = false
	findclosest($Og_1_spell)
func _on_button2_button_down():
	mousefollow2 = true
func _on_button2_button_up():
	mousefollow2 = false
	findclosest($Og_2_spell)
func _on_button3_button_down():
	mousefollow3 = true
func _on_button3_button_up():
	mousefollow3 = false
	findclosest($Og_3_spell)
func findclosest(compareNode):
	distance = [sqrt(pow(compareNode.global_position.y - $Spell_order_manager/Spell_1.global_position.y, 2)+pow(compareNode.global_position.x - $Spell_order_manager/Spell_1.global_position.x, 2))]
	distance.push_back(sqrt(pow(compareNode.global_position.y - $Spell_order_manager/Spell_2.global_position.y, 2)+pow(compareNode.global_position.x - $Spell_order_manager/Spell_2.global_position.x, 2)))
	distance.push_back(sqrt(pow(compareNode.global_position.y - $Spell_order_manager/Spell_3.global_position.y, 2)+pow(compareNode.global_position.x - $Spell_order_manager/Spell_3.global_position.x, 2)))
	for i in range(distance.size()):
		distance[i] = abs(distance[i])
	closestspell = distance.find(distance.min())
	if closestspell == 0:
		compareNode.global_position = $Spell_order_manager/Spell_1.global_position
	elif closestspell == 1:
		compareNode.global_position = $Spell_order_manager/Spell_2.global_position
	elif closestspell == 2:
		compareNode.global_position = $Spell_order_manager/Spell_3.global_position

extends AnimatedSprite2D
var mousefollow1
var closestspell
var distance = []
func _ready():
	pass
func _process(delta):
	if mousefollow1:
		$Og_1_spell.global_position = get_global_mouse_position()
func _on_button_button_down():
	mousefollow1 = true
func _on_button_button_up():
	mousefollow1 = false
	findclosest($Og_1_spell)
	if closestspell == 0:
		$Og_1_spell.global_position = $Spell_order_manager/Spell_1.global_position
	elif closestspell == 1:
		$Og_1_spell.global_position = $Spell_order_manager/Spell_2.global_position
	elif closestspell == 2:
		$Og_1_spell.global_position = $Spell_order_manager/Spell_3.global_position
func findclosest(compareNode):
	distance = [sqrt(pow(compareNode.global_position.y - $Spell_order_manager/Spell_1.global_position.y, 2)+pow(compareNode.global_position.x - $Spell_order_manager/Spell_1.global_position.x, 2))]
	distance.push_back(sqrt(pow(compareNode.global_position.y - $Spell_order_manager/Spell_2.global_position.y, 2)+pow(compareNode.global_position.x - $Spell_order_manager/Spell_2.global_position.x, 2)))
	distance.push_back(sqrt(pow(compareNode.global_position.y - $Spell_order_manager/Spell_3.global_position.y, 2)+pow(compareNode.global_position.x - $Spell_order_manager/Spell_3.global_position.x, 2)))
	for i in range(distance.size()):
		distance[i] = abs(distance[i])
	closestspell = distance.find(distance.min())

extends AnimatedSprite2D
var mousefollow
var closestspell
func _ready():
	pass
func _process(delta):
	if mousefollow:
		$Node2D.global_position = get_global_mouse_position()
func _on_button_button_down():
	mousefollow = true
func _on_button_button_up():
	mousefollow = false
	var distance = [sqrt(pow($Node2D.global_position.y - $Spell_order_manager/Spell_1.global_position.y, 2)+pow($Node2D.global_position.x - $Spell_order_manager/Spell_1.global_position.x, 2))]
	distance.push_back(sqrt(pow($Node2D.global_position.y - $Spell_order_manager/Spell_2.global_position.y, 2)+pow($Node2D.global_position.x - $Spell_order_manager/Spell_2.global_position.x, 2)))
	distance.push_back(sqrt(pow($Node2D.global_position.y - $Spell_order_manager/Spell_3.global_position.y, 2)+pow($Node2D.global_position.x - $Spell_order_manager/Spell_3.global_position.x, 2)))
	for i in range(distance.size()):
		distance[i] = abs(distance[i])
	closestspell = distance.find(distance.min())
	if distance.find(distance.min()) == 0:
		$Node2D.global_position = $Spell_order_manager/Spell_1.global_position
	elif distance.find(distance.min()) == 1:
		$Node2D.global_position = $Spell_order_manager/Spell_2.global_position
	elif distance.find(distance.min()) == 2:
		$Node2D.global_position = $Spell_order_manager/Spell_3.global_position

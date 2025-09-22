extends AnimatedSprite2D
var mousefollow1
var mousefollow2
var mousefollow3
var closestspell
var distance = []
var buttonpos = [0, 1, 2]
var buttonEmpty

func _ready():
	pass

func _process(_delta):
	if mousefollow1:
		$Og_1_spell.global_position = get_global_mouse_position()
	elif mousefollow2:
		$Og_2_spell.global_position = get_global_mouse_position()
	elif mousefollow3:
		$Og_3_spell.global_position = get_global_mouse_position()

func _on_button1_button_down():
	mousefollow1 = true
	buttonEmpty = buttonpos[0]

func _on_button1_button_up():
	mousefollow1 = false
	findclosest($Og_1_spell)

func _on_button2_button_down():
	mousefollow2 = true
	buttonEmpty = buttonpos[1]

func _on_button2_button_up():
	mousefollow2 = false
	findclosest($Og_2_spell)

func _on_button3_button_down():
	mousefollow3 = true
	buttonEmpty = buttonpos[2]

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
	movestuff(compareNode)

func movestuff(compareNode):
	if closestspell == 0:
		compareNode.global_position = $Spell_order_manager/Spell_1.global_position
		if buttonEmpty == 0:
			pass
		else:
			moveduplicate()
	elif closestspell == 1:
		compareNode.global_position = $Spell_order_manager/Spell_2.global_position
		if buttonEmpty == 1:
			pass
		else:
			moveduplicate()
	elif closestspell == 2:
		compareNode.global_position = $Spell_order_manager/Spell_3.global_position
		if buttonEmpty == 2:
			pass
		else:
			moveduplicate()

func moveduplicate():
	if buttonpos.find(closestspell) == 0:
		buttonpos[buttonpos.find(buttonEmpty)] = closestspell
		buttonpos[0] = buttonEmpty
		if buttonEmpty == 0:
			$Og_1_spell.global_position = $Spell_order_manager/Spell_1.global_position
		elif buttonEmpty == 1:
			$Og_1_spell.global_position = $Spell_order_manager/Spell_2.global_position
		elif buttonEmpty == 2:
			$Og_1_spell.global_position = $Spell_order_manager/Spell_3.global_position
	elif buttonpos.find(closestspell) == 1:
		buttonpos[buttonpos.find(buttonEmpty)] = closestspell
		buttonpos[1] = buttonEmpty
		if buttonEmpty == 0:
			$Og_2_spell.global_position = $Spell_order_manager/Spell_1.global_position
		elif buttonEmpty == 1:
			$Og_2_spell.global_position = $Spell_order_manager/Spell_2.global_position
		elif buttonEmpty == 2:
			$Og_2_spell.global_position = $Spell_order_manager/Spell_3.global_position
	elif buttonpos.find(closestspell) == 2:
		buttonpos[buttonpos.find(buttonEmpty)] = closestspell
		buttonpos[2] = buttonEmpty
		if buttonEmpty == 0:
			$Og_3_spell.global_position = $Spell_order_manager/Spell_1.global_position
		elif buttonEmpty == 1:
			$Og_3_spell.global_position = $Spell_order_manager/Spell_2.global_position
		elif buttonEmpty == 2:
			$Og_3_spell.global_position = $Spell_order_manager/Spell_3.global_position

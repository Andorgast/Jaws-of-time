extends AnimatedSprite2D
var mousefollow1
var mousefollow2
var mousefollow3
var mousefollow4
var closestspell
var distance = []
var buttonpos = [0, 1, 2, 3]
var buttonEmpty
var buttonid
var texture
var texture1 = preload("res://Assets/button0.png")
var texture2 = preload("res://Assets/button1.png")
var texture3 = preload("res://Assets/button2.png")
var texture4 = preload("res://Assets/button3.png")
var file

func _ready():
	file = FileAccess.open("res://attacks.data", FileAccess.READ)
	buttonid = file.get_var()
	file.close()
	preparetexture(0)
	$Og_1_spell/TextureButton.texture_normal = texture
	preparetexture(1)
	$Og_2_spell/TextureButton.texture_normal = texture
	preparetexture(2)
	$Og_3_spell/TextureButton.texture_normal = texture
	preparetexture(3)
	$Og_4_spell/TextureButton.texture_normal = texture
	
func preparetexture(toPrepare):
	if buttonid[toPrepare] == 0:
		texture = texture1
	elif buttonid[toPrepare] == 1:
		texture = texture2
	elif buttonid[toPrepare] == 2:
		texture = texture3
	elif buttonid[toPrepare] == 3:
		texture = texture4
		
func _process(_delta):
	if mousefollow1:
		$Og_1_spell.global_position = get_global_mouse_position()
	elif mousefollow2:
		$Og_2_spell.global_position = get_global_mouse_position()
	elif mousefollow3:
		$Og_3_spell.global_position = get_global_mouse_position()
	elif mousefollow4:
		$Og_4_spell.global_position = get_global_mouse_position()

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

func _on_button4_button_down():
	mousefollow4 = true
	buttonEmpty = buttonpos[3]

func _on_button4_button_up():
	mousefollow4 = false
	findclosest($Og_4_spell)

func findclosest(compareNode):
	distance = [sqrt(pow(compareNode.global_position.y - $Spell_order_manager/Spell_1.global_position.y, 2)+pow(compareNode.global_position.x - $Spell_order_manager/Spell_1.global_position.x, 2))]
	distance.push_back(sqrt(pow(compareNode.global_position.y - $Spell_order_manager/Spell_2.global_position.y, 2)+pow(compareNode.global_position.x - $Spell_order_manager/Spell_2.global_position.x, 2)))
	distance.push_back(sqrt(pow(compareNode.global_position.y - $Spell_order_manager/Spell_3.global_position.y, 2)+pow(compareNode.global_position.x - $Spell_order_manager/Spell_3.global_position.x, 2)))
	distance.push_back(sqrt(pow(compareNode.global_position.y - $Spell_order_manager/Spell_4.global_position.y, 2)+pow(compareNode.global_position.x - $Spell_order_manager/Spell_4.global_position.x, 2)))
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
	elif closestspell == 3:
		compareNode.global_position = $Spell_order_manager/Spell_4.global_position
		if buttonEmpty == 3:
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
		elif buttonEmpty == 3:
			$Og_1_spell.global_position = $Spell_order_manager/Spell_4.global_position
	elif buttonpos.find(closestspell) == 1:
		buttonpos[buttonpos.find(buttonEmpty)] = closestspell
		buttonpos[1] = buttonEmpty
		if buttonEmpty == 0:
			$Og_2_spell.global_position = $Spell_order_manager/Spell_1.global_position
		elif buttonEmpty == 1:
			$Og_2_spell.global_position = $Spell_order_manager/Spell_2.global_position
		elif buttonEmpty == 2:
			$Og_2_spell.global_position = $Spell_order_manager/Spell_3.global_position
		elif buttonEmpty == 3:
			$Og_2_spell.global_position = $Spell_order_manager/Spell_4.global_position
	elif buttonpos.find(closestspell) == 2:
		buttonpos[buttonpos.find(buttonEmpty)] = closestspell
		buttonpos[2] = buttonEmpty
		if buttonEmpty == 0:
			$Og_3_spell.global_position = $Spell_order_manager/Spell_1.global_position
		elif buttonEmpty == 1:
			$Og_3_spell.global_position = $Spell_order_manager/Spell_2.global_position
		elif buttonEmpty == 2:
			$Og_3_spell.global_position = $Spell_order_manager/Spell_3.global_position
		elif buttonEmpty == 3:
			$Og_3_spell.global_position = $Spell_order_manager/Spell_4.global_position
	elif buttonpos.find(closestspell) == 3:
		buttonpos[buttonpos.find(buttonEmpty)] = closestspell
		buttonpos[3] = buttonEmpty
		if buttonEmpty == 0:
			$Og_4_spell.global_position = $Spell_order_manager/Spell_1.global_position
		elif buttonEmpty == 1:
			$Og_4_spell.global_position = $Spell_order_manager/Spell_2.global_position
		elif buttonEmpty == 2:
			$Og_4_spell.global_position = $Spell_order_manager/Spell_3.global_position
		elif buttonEmpty == 3:
			$Og_4_spell.global_position = $Spell_order_manager/Spell_4.global_position

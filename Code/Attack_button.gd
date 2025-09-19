extends Button
var attacktype
var connected = false
#func _ready():
#	get_node("../Enemy").attack_buddy.connect(_on_buddy_attacked)
func _physics_process(_delta):
	if !connected && (get_node_or_null("../Enemy1") != null):
		get_node("../Enemy1").attack_buddy.connect(_on_buddy_attacked)
		connected = true
	elif !connected && (get_node_or_null("../Enemy") != null):
		get_node("../Enemy").attack_buddy.connect(_on_buddy_attacked)
		connected = true
func _on_pressed():
	$atk1.visible = !$atk1.visible
	$atk2.visible = !$atk2.visible
	$atk3.visible = !$atk3.visible
func enemyturn():
	visible = false
	$atk1.visible = false
	$atk2.visible = false
	$atk3.visible = false
func buddyturn():
	visible = !false
func _on_atk_1_pressed():
	enemyturn()
func _on_atk_2_pressed():
	enemyturn()
func _on_atk_3_pressed():
	enemyturn()
func _on_buddy_attacked(_not_used, _neither_is_this):
	buddyturn()
func _on_buddy_skip():
	enemyturn()
#func _on_undertermined_trigger(attack_to_be_swapped, attack_id):
	#if attack_to_be_swapped == 1:
		
	#if attack_to_be_swapped == 2:
		
	#if attack_to_be_swapped == 3:
		

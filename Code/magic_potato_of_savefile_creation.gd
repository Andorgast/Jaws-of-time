extends Node2D
func _ready():
	create_attacks()
	create_savedata()
func create_attacks():
	var file = FileAccess.open("res://attacks.data", FileAccess.WRITE)
	# 0 is Flash, 1 is Bonk, 2 is Jolt, 3 is Heal
	var atk_id = [0, 3, 2, 1]
	var atk_damage = [1, 2, 2, -3, 10]
	var atk_effect = [1, 0, 2, 3, 4]
	var dmg_type = [3, 1, 2, 4, 2]
	var mana_cost = [1, -2, 2, 5, 0]
	file.store_var(atk_id)
	file.store_var(atk_damage)
	file.store_var(atk_effect)
	file.store_var(dmg_type)
	file.store_var(mana_cost)
	file.close()
func create_savedata():
	var file = FileAccess.open("res://save.data", FileAccess.WRITE)
	var enemy_id = [0]
	var level = 0
	var maxhp = 10
	var currenthp = 10
	var mana = 5
	file.store_var(enemy_id)
	file.store_var(level)
	file.store_var(maxhp)
	file.store_var(currenthp)
	file.store_var(mana)
	file.close()

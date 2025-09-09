extends Node2D
func _ready():
	create_attacks()
	create_savedata()
func create_attacks():
	var file = FileAccess.open("res://attacks.data", FileAccess.WRITE)
	var atk_1_id = 0 #flash
	var atk_2_id = 1 #bonk!
	var atk_3_id = 2 #lightning jolt
	var atk_damage = [1, 3, 2]
	var atk_effect = [1, 0, 2]
	var dmg_type = [3, 1, 2]
	file.store_var(atk_1_id)
	file.store_var(atk_2_id)
	file.store_var(atk_3_id)
	file.store_var(atk_damage)
	file.store_var(atk_effect)
	file.store_var(dmg_type)
	file.close()
func create_savedata():
	var file = FileAccess.open("res://save.data", FileAccess.WRITE)
	var enemy_id = [1]
	var level = 1
	var maxhp = 10
	var currenthp = 10
	file.store_var(enemy_id)
	file.store_var(level)
	file.store_var(maxhp)
	file.store_var(currenthp)
	file.close()

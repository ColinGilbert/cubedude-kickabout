extends "res://Players/PlayerTemplate.gd"


func _ready():
	player_id = 1
	my_spawn = get_tree().get_root().find_node("Player%sStart" % player_id, true, false) 

extends Spatial


func _on_GoalDetector_body_entered(body, goal_id):
	var scoring_player
	if goal_id == 1:
		scoring_player = "2"
	else:
		scoring_player = "1"
	print("Player " + scoring_player + " has scored a goal!" )
	get_tree().call_group("game_pieces", "freeze")
	$Timer.start()


func _on_Timer_timeout():
	get_tree().call_group("game_pieces", "reset")
	$Timer.stop()

extends Spatial

var Player1Score = 0
var Player2Score = 0

func _on_GoalDetector_body_entered(body, goal_id):
	var scoring_player
	if goal_id == 1:
		scoring_player = 2
	else:
		scoring_player = 1
	#print("Player " + str(scoring_player) + " has scored a goal!" )
	get_tree().call_group("game_pieces", "freeze")
	$Timer.start()
	update_score(scoring_player)


func _on_Timer_timeout():
	get_tree().call_group("game_pieces", "reset")
	$Timer.stop()

func update_score(player):
	var new_score
	match player:
		1:
			Player1Score += 1
			new_score = Player1Score
		2:
			Player2Score += 1
			new_score = Player2Score
	$GUI.update_score(player, new_score)
	check_game_over(player, new_score)
	
func check_game_over(player, score):
	if score == 3:
		$Timer.queue_free()
		$GUI.game_over(player)

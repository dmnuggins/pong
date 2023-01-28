extends Node

var player_score = 0
var opponent_score = 0
var player_possession = true
var winner

func _ready():
	pass

func _process(delta):
	$HUD.get_node("PlayerScoreLabel").text = str(player_score)
	$HUD.get_node("OpponentScoreLabel").text = str(opponent_score)
	$HUD.get_node("TimerLabel").text = str(int($ResetTimer.time_left + 1))
	
	# checks for end game condition
	if player_score == 11:
		end_game(1)
	if opponent_score == 11:
		end_game(2)

func _on_Left_body_entered(body):
	var player_ball_spawn = $Player.get_node("PlayerBallSpawn").global_position
	player_possession = true
	on_score()
	$Goal.play()
	$ResetTimer.start()
	opponent_score += 1

func _on_Right_body_entered(body):
	var opponent_ball_spawn = $Opponent.get_node("OpponentBallSpawn").global_position
	player_possession = false
	on_score()
	$Goal.play()
	player_score += 1

func _on_ResetTimer_timeout():
	if player_possession:
		var player_ball_spawn = $Player.get_node("PlayerBallSpawn").global_position
		$Ball.position = player_ball_spawn
	else:
		var opponent_ball_spawn = $Opponent.get_node("OpponentBallSpawn").global_position
		$Ball.position = opponent_ball_spawn
		$Opponent/OpponentTimer.start()
	var ball = load("res://Ball/Ball.gd").new()
	ball.update_ball_status()
	$HUD.get_node("TimerLabel").hide()
	$Ball.show()
	
func on_score():
	$Ball.hide()
	$HUD.get_node("TimerLabel").show()
	$ResetTimer.start()

func end_game(winner):
	$ResetTimer.stop()
	$Opponent.get_node("OpponentTimer").stop()
	$Divider.hide()
	$HUD.get_node("TimerLabel").hide()
	if winner == 1:
		$HUD.get_node("MessageLabel").text = "PLAYER 1 WINS"
	else:
		$HUD.get_node("MessageLabel").text = "COMPUTER WINS"
	$HUD.get_node("Buttons").show()
	$HUD.get_node("MessageLabel").show()
	

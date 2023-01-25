extends Node

var player_score = 0
var opponent_score = 0

func _ready():
	pass

func _process(delta):
	$HUD.get_node("PlayerScoreLabel").text = str(player_score)
	$HUD.get_node("OpponentScoreLabel").text = str(opponent_score)

func _on_Left_body_entered(body):
	var player_ball_spawn = $Player.get_node("PlayerBallSpawn").global_position
	$Ball.position = player_ball_spawn
#	print($Player.get_node("PlayerBallSpawn").global_position)
#	print("LEFT goal entered")
	opponent_score += 1

func _on_Right_body_entered(body):
	var opponent_ball_spawn = $Opponent.get_node("OpponentBallSpawn").global_position
	$Ball.position = opponent_ball_spawn
#	print($Opponent.get_node("OpponentBallSpawn").global_position)
#	print("RIGHT goal entered")
	player_score += 1

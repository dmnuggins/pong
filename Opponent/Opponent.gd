extends KinematicBody2D

var speed = 400
var ball

func _ready():
	ball = get_parent().find_node("Ball")

func _physics_process(delta):
	move_and_slide(Vector2(0, get_opponent_move() * speed))

# y vector will be determined based on ball's position relative to opponent
func get_opponent_move():
	if abs(ball.position.y - position.y) > 25:
		if ball.position.y > position.y:
			return 1
		else:
			return -1
	else:
		return 0

# could use "action_press()" to simulate pressing space bar when launching ball

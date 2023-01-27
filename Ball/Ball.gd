extends KinematicBody2D

signal score

# movement with KinematicBody2D
export var speed = 575.0
var velocity = Vector2.ZERO
var in_play = false
var test_num = 0
var possession = 0

func _ready():
	pass
func _physics_process(delta):	
	# keeps ball attached to player paddle
	if !in_play:
		if possession == 0:
			position = get_parent().find_node("Player").get_node("PlayerBallSpawn").global_position
		else:
			position = get_parent().find_node("Opponent").get_node("OpponentBallSpawn").global_position
	
	if Input.is_action_just_pressed("launch"):
		print("Spacebar pressed")
		print(in_play)
		play_ball() # sets ball back to in play status
		
	var collision = move_and_collide(velocity * speed * delta)
	
	if collision:
		velocity = velocity.bounce(collision.normal)
	
func update_ball_status():
	in_play = !in_play
	
func stop_ball():
	velocity = Vector2.ZERO

func play_ball():
	update_ball_status()
	randomize()
	if possession == 0:
		velocity.x = 1
		velocity.y = [-0.8,0.8][randi() % 2]
	else:
		velocity.x = -1
		velocity.y = [-0.8,0.8][randi() % 2]

func _on_Right_body_entered(body):
	possession = 1
	update_ball_status()
	stop_ball()

func _on_Left_body_entered(body):
	possession = 0
	update_ball_status()
	stop_ball()
	
func _on_OpponentTimer_timeout():
	play_ball()

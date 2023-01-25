extends KinematicBody2D

export var speed = 500.0
var screen_size = Vector2.ZERO
var score = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size

func update_score():
	score += 1

func _physics_process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	var collision = move_and_collide(speed * velocity * delta)
	
	if collision:
		print("Player collided with ", collision.collider.name)


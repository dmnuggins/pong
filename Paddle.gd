extends KinematicBody2D

export var speed = 200.0
var screen_size = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	print(screen_size)
	

func _process(delta):
	var direction = Vector2.ZERO
	if Input.is_action_pressed("move_up"):
		direction.y -= 1
	if Input.is_action_pressed("move_down"):
		direction.y += 1
	var collision = move_and_collide(speed * direction * delta)
	if collision:
		print("Player collided with ", collision.collider.name)
	
	
#	var direction = Vector2.ZERO
#	if Input.is_action_pressed("move_up"):
#		direction.y -= 1
#	if Input.is_action_pressed("move_down"):
#		direction.y += 1
#
#	position += direction * speed * delta
#	position.y = clamp(position.y, 0, screen_size.y)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

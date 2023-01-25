extends KinematicBody2D

signal score

# movement with KinematicBody2D
export var speed = 600.0
var velocity = Vector2.ZERO

func _ready():
	randomize()
	velocity.x = [-1,1][randi() % 2]
	velocity.y = [-0.8,0.8][randi() % 2]
	

func _physics_process(delta):

	var collision = move_and_collide(velocity * speed * delta)
#	print(velocity)
	if collision:
		velocity = velocity.bounce(collision.normal)
		
#		print(velocity)
		print("Ball collided with ", collision.collider.name)
		if collision.collider.is_in_group("goals"):
			emit_signal("score")
			print("SCORED")
#			queue_free()

#func respawn():
#	emit_signal("score")

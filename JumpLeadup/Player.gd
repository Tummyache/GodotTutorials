extends KinematicBody2D

export(float) var speed = 100
export(float) var jump_force = 400
var velocity: Vector2

func _ready():
	pass

func _physics_process(delta):
	velocity.x = 0
	if (Input.is_action_pressed("left")):
		 velocity.x = -speed
	if (Input.is_action_pressed("right")):
		 velocity.x = speed
	
	velocity.y += 981 * delta
	
	velocity = move_and_slide_with_snap(velocity, Vector2.DOWN, Vector2.UP)

	# Check for jumping. is_on_floor() must be called after movement code.
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		$AnimationPlayer.play("Jump")
	
	pass

func _jump():
	velocity.y = -jump_force
	position.y -= 5

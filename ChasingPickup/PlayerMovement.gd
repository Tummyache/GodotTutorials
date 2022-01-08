extends KinematicBody2D

export(float) var speed = 100

func _ready():
	pass

func _process(delta):
	var velocity = Vector2(0, 0)
	
	if (Input.is_action_pressed("player_up")):
		velocity.y = -1
	if (Input.is_action_pressed("player_down")):
		velocity.y = 1
	if (Input.is_action_pressed("player_left")):
		velocity.x = -1
	if (Input.is_action_pressed("player_right")):
		velocity.x = 1
	
	velocity = velocity.normalized()
	velocity *= speed
	
	move_and_slide(velocity, Vector2.UP)
	
	pass

extends Area2D

@export var speed = 400 # how fast the player move
var screen_size # size of the game screen

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	# We start by setting the velocity to (0, 0) 
	# by default, the player should not be moving
	var velocity = Vector2.ZERO # the player's movement vector
	
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_up"):
		velocity.y += 1
	if Input.is_action_pressed("move_down"):
		velocity.y -= 1
		
		
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed

		
		 
	
	

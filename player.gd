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
		velocity.y -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
		
		
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
		
	
	# Now that we have a movement direction,
	# we can update the player's position.
	
	#_process() işlevindeki delta parametresi, 
	# önceki çerçevenin tamamlanması için geçen süre olan 
	# çerçeve uzunluğunu ifade eder. 
	# Bu değeri kullanmak, kare hızı değişse bile 
	# hareketinizin tutarlı kalmasını sağlar.
	
	position += velocity * delta
	
	# clamping (kelepçeleme) ile ekran dışarısına çıkmayı önle
	position = position.clamp(Vector2.ZERO, screen_size)
	
	
	
	
	
		
		
		

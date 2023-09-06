# With Area2D we can detect objects that overlap or run into the player. 
# Change the node's name to "Player" by double-clicking on it. 
# Now that we've set the scene's root node, 
# we can add additional nodes to give it more functionality.
extends Area2D

# define hit signal for emitting each collisions 
signal hit

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
	
	#_process() işlevindeki delta parametresini 
	# kullanmak, kare hızı değişse bile 
	# hareketinizin tutarlı kalmasını sağlar.
	
	position += velocity * delta
	
	# clamping (kelepçeleme) ile ekran dışarısına çıkmayı önle
	position = position.clamp(Vector2.ZERO, screen_size)
	
	
		
	# CHOOSING ANIMATIONS
	
	# We have the "walk" animation, which shows the player walking to the right. 
	# This animation should be flipped horizontally 
	# using the flip_h property for left movement. 
	# We also have the "up" animation, which should be flipped vertically 
	# with flip_v for downward movement.
	
	if velocity.x != 0:
		$AnimatedSprite2D.animation = "walk"
		$AnimatedSprite2D.flip_v = false
		
		# karakterin sağa gitme durumunda "walk" animasyonu default haliyle gelir
		# yatay hız negatifse (sola gidiyorsa) walk animasyonunu flip_h değerini true yapmalıyız
		$AnimatedSprite2D.flip_h = velocity.x < 0
	elif velocity.y != 0:
		$AnimatedSprite2D.animation = "up"
		
		# dikey hız pozitifse walk animasyonunu flip_v değerini true yap
		$AnimatedSprite2D.flip_v = velocity.y > 0
		
		
# the player will be hidden when the game starts
#hide()
	
	
# PREPARING FOR COLLISIONS
	
func _on_body_entered(body):
	hide() # Player disappears after being hit.
	hit.emit()
	# Must be deferred as we can't change physics properties on a physics callback.
	# Bir düşman oyuncuya her vurduğunda, sinyal yayılacaktır. 
	# Vuruş sinyalini birden fazla tetiklememek için 
	# oyuncunun çarpışmasını devre dışı bırakmamız gerekiyor.
	$CollisionShape2D.set_deferred("disabled", true)
	
	
func start(pos):
	# yeni bir oyuna başlarken oyuncuyu sıfırla
	position = pos
	show()
	$CollisionShape2D.disabled = false
	
	
	


extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var mob_types = $AnimatedSprite2D.sprite_frames.get_animation_names()
	$AnimatedSprite2D.play(mob_types[randi() % mob_types.size()])


# Mobların ekrandan çıktıklarında kendilerini silmelerini sağlamaktır. 
# VisibleOnScreenNotifier2D düğümünün screen_exited() sinyalini Mob'a bağlayın
func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free() # bellekten sil
	
	

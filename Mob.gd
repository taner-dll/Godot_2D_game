extends RigidBody2D


# animasyonu oynatıyoruz ve üç animasyon türünden birini rastgele seçiyoruz:
func _ready():
	
	# mob_types is an array ["walk", "swim", "fly"]
	var mob_types = $AnimatedSprite2D.sprite_frames.get_animation_names()
	$AnimatedSprite2D.play(mob_types[randi() % mob_types.size()])
	

# Son parça ise çetelerin ekrandan çıktıklarında kendilerini silmelerini sağlamaktır. 
# VisibleOnScreenNotifier2D düğümünün screen_exited() sinyalini Mob'a bağlayın
func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
	

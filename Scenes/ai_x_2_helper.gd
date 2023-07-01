extends Area2D


func _on_body_entered(body):
	# 1. MAKE THIS X2 HELPER POWER UP DESPAWN.
	# 2. THEN SPAWN A HELPER AI CHARACTER IN THE GAME.
	queue_free()
	
	
	var ai_helper_scene = preload("res://Scenes/helper_ai.tscn")
	var ai_helper_instance = ai_helper_scene.instantiate()
	get_parent().add_child(ai_helper_instance)
	ai_helper_instance.position=Vector2(576,324)

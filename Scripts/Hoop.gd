extends StaticBody2D


func _on_area_2d_area_entered(area):
	if area.is_in_group("ball"):
		area.queue_free()
	pass # Replace with function body.

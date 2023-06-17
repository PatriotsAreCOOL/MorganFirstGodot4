extends Area2D

var addspeed=1853

func _on_body_entered(body):
	if body.is_in_group("Player"):
		body.speed+=addspeed
		queue_free()
	pass # Replace with function body.

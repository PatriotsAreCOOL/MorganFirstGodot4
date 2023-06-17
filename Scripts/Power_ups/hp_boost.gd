extends Area2D

var addboost=5















func _on_body_entered(body):
	if body.is_in_group("Player"):
		body.maxhealth+=addboost
		body.health=body.maxhealth
		queue_free()
	pass # Replace with function body.

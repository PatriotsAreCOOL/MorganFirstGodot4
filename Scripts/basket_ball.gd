extends Area2D

var speed= 1500
var grav = 50


func _process(delta):
	position.y += grav*delta
	position += Vector2(speed*delta,0).rotated(rotation)
	




func _on_body_entered(body):
	if body.is_in_group("Enemy"):
		body.health-=1
		queue_free()
		
	if body.is_in_group("Hoop"):
		queue_free()
	
	pass # Replace with function body.


func _on_area_entered(area):
	pass # Replace with function body.


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
	pass # Replace with function body.

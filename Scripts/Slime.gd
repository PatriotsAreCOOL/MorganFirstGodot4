extends CharacterBody2D

var player
var speed=50


var health=2



func _ready():
	player= get_tree().get_nodes_in_group("Player")[0]
func _process(delta):
	if health <=0:
		queue_free()
	elif health==1:
		speed=25

	velocity = position.direction_to(player.position) * speed
	move_and_slide()
	
	


func _on_area_2d_body_entered(body):
	if body.is_in_group("Player"):
		body.health-=1.5
	pass # Replace with function body.

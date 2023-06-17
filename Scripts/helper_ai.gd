extends CharacterBody2D

var speed=10000


var player
var nearestEnemy
var distance=75

@onready var _basketball = preload("res://Scenes/basket_ball.tscn")

func _ready():
	player=get_parent().get_node("Player")


func _physics_process(delta):
	var toPlayer=position.distance_to(player.global_position)
	if distance <toPlayer:
		velocity =position.direction_to(player.global_position)*speed*delta
	else:
		velocity=Vector2.ZERO
	move_and_slide()




func _on_timer_timeout():
	var distance=1000
	var guy
	if get_parent().get_node("Enemies").get_child_count() == 0:
		return
	
	for i in get_parent().get_node("Enemies").get_children():
		var temp = position.distance_to(i.global_position)
		if temp<distance:
			distance=temp
			guy = i
	var bullet=_basketball.instantiate()
	bullet.position=global_position
	get_parent().add_child(bullet)
	bullet.look_at(guy.position)
	$Timer.start()

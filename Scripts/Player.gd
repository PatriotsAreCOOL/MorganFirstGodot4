extends CharacterBody2D

var speed = 21_000
@onready var _bullet=preload("res://Scenes/basket_ball.tscn")

var health=22

var maxhealth=22


var direction=1


func _physics_process(delta):
	velocity.x=0
	velocity.y=0
	
	if Input.is_action_pressed("Up"):
		velocity.y -= speed * delta
	if Input.is_action_pressed("Down"):
		velocity.y +=speed*delta
	if Input.is_action_pressed("Left"):
		velocity.x -= speed*delta
		direction=-1
	if Input.is_action_pressed("Right"):
		direction=1
		velocity.x+= speed*delta
	
	
	if Input.is_action_just_pressed("Shoot"):
		var bullet=_bullet.instantiate()
		bullet.position=global_position
		bullet.look_at(get_global_mouse_position())
		get_parent().add_child(bullet)
	
	
	
	move_and_slide()


func _process(delta):
	if health<=0:
		get_tree().reload_current_scene()
	$sprite.scale=Vector2(direction,1)
	$ProgressBar.value=health
	
	$ProgressBar.max_value=maxhealth
	
	
	
	
	
	
	
	

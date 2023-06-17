extends Node2D

@onready var BoostTimer=$BoostTimer




@onready var timer=$Timer
@onready var _enemy = preload("res://Scenes/Slime.tscn")
@onready var _speed=preload("res://Scenes/Power_UPs/Speed_power_up.tscn")
@onready var _hp=preload("res://Scenes/Power_UPs/hp_boost.tscn")





var width = 1010
var height = 550


func speedboostspawn():
	randomize()
	var x=randi_range(40,1010)
	var y=randi_range(40,550)
	var speed=_speed.instantiate()
	speed.position=Vector2(x,y)
	get_parent().add_child(speed)

func hpboostspawn():
	randomize()
	var x=randi_range(40,1010)
	var y=randi_range(40,550)
	var hp=_hp.instantiate()
	hp.position=Vector2(x,y)
	get_parent().add_child(hp)

	



func spawn():
	for i in 6:
		randomize()
		var enemy = _enemy.instantiate()
		enemy.position.x = randi_range(40,width)
		enemy.position.y = randi_range(40,height)
		get_parent().get_node("Enemies").add_child(enemy)
		

func _on_timer_timeout():
	spawn()
	timer.start()
	pass # Replace with function body.


func _on_boost_timer_timeout():
	randomize()
	var x=randi_range(0,1)
	if x==1:
		speedboostspawn()
	else:
		hpboostspawn()
	BoostTimer.start()
	pass # Replace with function body.

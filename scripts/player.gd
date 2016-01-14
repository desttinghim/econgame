
extends RigidBody2D

var input_states = preload("res://scripts/input_states.gd")

export var player_speed = 200
export var acceleration = 10

var btn_left = input_states.new("btn_left")
var btn_right = input_states.new("btn_right")
var btn_down = input_states.new("btn_down")
var btn_up = input_states.new("btn_up")

var current_speed = Vector2(0, 0)

# returns new vector
func move(cur_speed, speed, accel, delta):
	var return_speed = lerp(cur_speed, speed, accel * delta)
	return return_speed

func _ready():
	# Initialization here
	set_fixed_process(true)
	set_applied_force(Vector2(0,0))

func _fixed_process(delta):
	
	if btn_left.check() == 2:
		current_speed.x = move(current_speed.x, -player_speed, acceleration, delta)
	elif btn_right.check() == 2:
		current_speed.x = move(current_speed.x, player_speed, acceleration, delta)
	else:
		current_speed.x = move(current_speed.x, 0, acceleration, delta)
	
	if btn_up.check() == 2:
		current_speed.y = move(current_speed.y, -player_speed, acceleration, delta)
	elif btn_down.check() == 2:
		current_speed.y = move(current_speed.y, player_speed, acceleration, delta)
	else:
		current_speed.y = move(current_speed.y, 0, acceleration, delta)
	
	set_linear_velocity(Vector2(current_speed.x, current_speed.y))

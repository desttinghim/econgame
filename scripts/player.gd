
extends RigidBody2D

export var player_speed = 200
export var acceleration = 10
signal activate(position)

var input_states = preload("res://scripts/input_states.gd")

var btn_left = input_states.new("btn_left")
var btn_right = input_states.new("btn_right")
var btn_down = input_states.new("btn_down")
var btn_up = input_states.new("btn_up")
var btn_action = input_states.new("btn_action")

var current_speed = Vector2(0, 0)
var walking = true

# returns new vector
func move(cur_speed, speed, accel, delta):
	var return_speed = lerp(cur_speed, speed, accel * delta)
	return return_speed

func stop_walking():
	walking = false

func start_walking():
	walking = true

func _ready():
	add_to_group("player")
	add_user_signal("activate")
	# Initialization here
	set_fixed_process(true)
	set_applied_force(Vector2(0,0))

func _fixed_process(delta):
	
	if walking:
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
	else:
		set_linear_velocity(Vector2(0,0))
		
	if btn_action.check() == 3:
		if walking == false:
			start_walking()
			var boxes = get_tree().get_nodes_in_group(("dialogue_box"))
			for box in boxes:
				box.end_dialog()

		var npcs = get_tree().get_nodes_in_group("npcs")
		for npc in npcs:
			var dpos = self.get_pos() - npc.get_pos()
			var dist = sqrt(dpos.x * dpos.x + dpos.y*dpos.y)
			if dist<120 and npc.has_method("_on_activate"):
				npc._on_activate()


extends RigidBody2D

export var accel = 1
export var line = "snail"

signal buttered()

var current_speed = Vector2(0,0)

func _ready():
	# Initialization here
	add_to_group("npcs")
	set_fixed_process(true)


func _fixed_process(delta):
	current_speed.x = lerp(get_linear_velocity().x, 0, accel * delta)
	current_speed.y = lerp(get_linear_velocity().y, 0, accel * delta)
	set_linear_velocity(current_speed)


func put_in( body ):
	print("going in!")
	if body == self:
		queue_free()
		emit_signal("buttered")
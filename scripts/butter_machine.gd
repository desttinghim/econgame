
extends StaticBody2D

var raycast_snail = null
export var line = "butter_machine"
var talking = false
signal put_in(body)

func _ready():
	add_to_group("npcs")
	raycast_snail = get_node("RayCast2D")
	raycast_snail.add_exception(self)
	# Initialization here
	set_fixed_process(true)

func _fixed_process(delta):
	if raycast_snail.is_colliding():
		var body = raycast_snail.get_collider()
		emit_signal("put_in", body)

func _on_snail_buttered():
	var butter = get_node("../butter")
	butter.set_opacity(1)
	butter.set_pos(get_node("Position2D").get_global_pos())
	butter.set_linear_velocity((butter.get_pos() - get_pos()).normalized() * 10)

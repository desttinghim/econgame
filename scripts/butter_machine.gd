
extends StaticBody2D

var raycast_snail = null
signal put_in(body)

func _ready():
	#add_user_signal("put_in")
	raycast_snail = get_node("RayCast2D")
	raycast_snail.add_exception(self)
	# Initialization here
	set_fixed_process(true)

func _fixed_process(delta):
	if raycast_snail.is_colliding():
		var body = raycast_snail.get_collider()
		emit_signal("put_in", body)

func _on_snail_buttered():
	#get_node("../butter").

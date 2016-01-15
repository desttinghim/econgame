
extends Node2D

export var line = "entrepreneur"
var talking = false

func _ready():
	add_to_group("npcs")
	set_process(true)
	
func _process(delta):
	var player = get_node("../player")
	if player.get_pos() > get_pos() and player.get_pos() < get_pos() + get_scale():
		show_dialog()

func _on_activate():
	if talking == true:
		show_dialog()

func show_dialog():
	var boxes = get_tree().get_nodes_in_group(("dialogue_box"))
	for box in boxes:
		print("Here's a box")
		if not talking:
			box.show_dialog(line)
			talking = true
			for player in get_tree().get_nodes_in_group("player"):
				player.stop_walking()
		else:
			box.end_dialog()
			emit_signal("start_moving")
			talking = false
			for player in get_tree().get_nodes_in_group("player"):
				player.start_walking()





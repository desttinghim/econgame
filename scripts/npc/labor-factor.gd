
extends Node

var dialogue = [
"The third factor of production is labor.",
"Labor is people with all their efforts, abilities, and skills.",
"Everybody but a special group called Entrepreneurs",
"is included in this group."
]

func _ready():
	add_to_group("npcs")

func _on_activate():
	var boxes = get_tree().get_nodes_in_group("dialogue_box")
	for box in boxes: 
		box.show_dialogue(dialogue)

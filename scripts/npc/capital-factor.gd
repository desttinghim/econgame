
extends Node

var dialogue = [
"The second factor of production is capital.",
"Capital is defined as tools and machinery."
]

func _ready():
	add_to_group("npcs")

func _on_activate():
	var boxes = get_tree().get_nodes_in_group("dialogue_box")
	for box in boxes: 
		box.show_dialogue(dialogue)

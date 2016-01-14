
extends Node

var dialogue = [
"The fourth factor of production is entreprenuers.",
"These special people are singled out because they are risk-takers.",
"They do something new with resources, or factors of production.",
"Because of this, they are the primary drivers of the economy."
]

func _ready():
	add_to_group("npcs")

func _on_activate():
	var boxes = get_tree().get_nodes_in_group("dialogue_box")
	for box in boxes: 
		box.show_dialogue(dialogue)


extends Panel

func _on_player_show_dialogue(dialogue):
	get_node("dialogue_text").clear()
	get_node("dialogue_text").add_text(dialogue)

func _ready():
	#connect("show_dialogue", self, "_receive_dialogue")
	pass


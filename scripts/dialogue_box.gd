
extends Panel

func _on_player_show_dialogue(dialogue):
	self.set_opacity(1)
	get_node("dialogue_text").clear()
	get_node("dialogue_text").add_text(dialogue)
	get_node("dialogue_timeout").set_wait_time(5)
	get_node("dialogue_timeout").start()

func _ready():
	#connect("show_dialogue", self, "_receive_dialogue")
	self.set_opacity(0)
	pass

func _on_dialogue_timeout_timeout():
	self.set_opacity(0)
	get_node("dialogue_text").clear()

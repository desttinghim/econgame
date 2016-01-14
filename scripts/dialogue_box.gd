
extends Panel

func _on_player_show_dialogue(dialogue):
	show_dialogue(dialogue)


func _ready():
	#connect("show_dialogue", self, "_receive_dialogue")
	self.set_opacity(0)
	pass

func _on_dialogue_timeout_timeout():
	self.set_opacity(0)
	get_node("dialogue_text").clear()

func show_dialogue(dialogue):
	self.set_opacity(1)
	get_node("dialogue_text").clear()
	for line in dialogue:
		get_node("dialogue_text").add_text(str(line, '\n'))
	get_node("dialogue_timeout").set_wait_time(5)
	get_node("dialogue_timeout").start()

func _on_NPC_show_dialogue( dialogue ):
	show_dialogue(dialogue)

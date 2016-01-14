
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
	
	var countto = max(3,dialogue.size()-1)
	
	for line in range(countto):
		get_node("dialogue_text").add_text(str(dialogue[line], '\n'))
	
	if dialogue.size() > 3:
		var subarraydialogue
		var subcount = 0
		for line in range(3,dialogue.size()-1):
			subarraydialogue[subcount] = dialogue[line]
			subcount += 1
		get_node("dialogue_timeout").call_deferred("show_dialogue", subarraydialogue)
		get_node("dialogue_timeout").start()
	else: 
		get_node("dialogue_timeout").set_wait_time(5)
		get_node("dialogue_timeout").start()

func _on_NPC_show_dialogue( dialogue ):
	show_dialogue(dialogue)

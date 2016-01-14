
extends Panel

var showagain = false
var shownext = 0
var showend
var temp_dialogue

func _on_player_show_dialogue(dialogue):
	show_dialogue(dialogue)


func _ready():
	#connect("show_dialogue", self, "_receive_dialogue")
	self.set_opacity(0)
	pass

func _on_dialogue_timeout_timeout():
	get_node("dialogue_text").clear()
	if showagain:
		show_dialogue(temp_dialogue, shownext, showend)
	else:
		self.set_opacity(0)

func show_dialogue(dialogue, page, endpage):
	self.set_opacity(1)
	get_node("dialogue_text").clear()
	
	var countto = min(3,dialogue.size()-1)
	
	for line in range(countto):
		get_node("dialogue_text").add_text(str(dialogue[line], '\n'))
	
	
	get_node("dialogue_timeout").set_wait_time(1)
	get_node("dialogue_timeout").start()
	
	if page == endpage:
		showagain = false
	else:
		showagain = true
		shownext = page+1
		showend = endpage
		temp_dialogue = dialogue

func _on_NPC_show_dialogue( dialogue ):
	show_dialogue(dialogue)

### class for dialogue handling
extends Node

var dialogue

signal display_dialogue(dialogue)

func _init(var dialogue):
	self.dialogue = dialogue

func show_dialogue():
	emit_signal("display_dialogue", dialogue)
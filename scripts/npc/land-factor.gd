
extends Node

var dialogue = """
The first factor of production is land.
"""
signal show_dialogue(dialogue)

func _on_player_activate( position ):
	var dx = self.get_pos().x-position.x
	var dy = self.get_pos().y-position.y
	var len = sqrt( dx*dx + dy*dy )
	print(len)
	if len < 18:
		emit_signal("show_dialogue",str( dialogue ))

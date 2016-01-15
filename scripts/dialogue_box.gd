
extends Panel

var line_node
var dialog_dict = {
	capital = "Hello! I'm Capital Man. I like things, all sorts of things! For example, that butter making machine over there. It can turn practically anything into butter, though it works best on snails. It's the sort of [i]capital[/i] that produces a lot of value for a company.",
	land = "I'm Land Dude. I, like, handle things like land. And animals. Basically anything not made by man. I'm [b]all natural[/b], man. ",
	labor = "Greetings, I am Labor Lad! I'm all about [b]people and what they do[/b]."
}

func _ready():
	set_opacity(0)

func show_dialog( line ):
	set_opacity(1)
	add_child(RichTextLabel.new())
	line_node = get_child(get_child_count()-1)
	
	line_node.set_use_bbcode(true)
	line_node.set_visible_characters(-1)
	line_node.parse_bbcode(dialog_dict[line])
	
	print(dialog_dict[line])
	print(line_node.is_using_bbcode())
	print(line_node.get_total_character_count())

func end_dialog():
	set_opacity( 0 )
	remove_child(line_node)

func _on_NPC_show_dialog( line ):
	show_dialogue( line )

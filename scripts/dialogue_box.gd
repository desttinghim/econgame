
extends Panel

var line_node
var dialog_dict = {
	capital = "Hello! I'm Capital Man. I like things, all sorts of things! For example, that butter making machine over there. It can turn practically anything into butter, though it works best on snails. It's the sort of [i]capital[/i] that produces a lot of value for a company.",
	land = "I'm Land Dude. I, like, handle things like land. And animals. Basically anything not made by man. I'm [b]all natural[/b], man. ",
	labor = "Greetings, I am Labor Lad! I'm all about [b]people and what they do[/b].",
	snail = "This is a snail. It is a land factor of production.",
	butter = "This is a butter. It is your product.",
	butter_machine = "This is the butter making machine! Put snail in, get butter out!"
}

func _ready():
	set_opacity(0)
	line_node = get_node("text")
	line_node.set_size( get_size() - Vector2(10, 10) )

func show_dialog( line ):
	set_opacity(1)
	
	line_node.set_bbcode( dialog_dict[line] )
	
	print(dialog_dict[line])

func end_dialog():
	set_opacity( 0 )
	line_node.set_bbcode( "" )

func _on_NPC_show_dialog( line ):
	show_dialogue( line )

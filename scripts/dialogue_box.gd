
extends Panel

var line_node
var dialog_dict = {
	capital = "Hello! I'm Capital Man, wizard of [b]Capital[/b]. I like things, all sorts of things! For example, that butter making machine to the right. It can turn practically anything into butter, though it works best on snails. It's the sort of [i]capital[/i] that produces a lot of value for a company.",
	land = "I'm Land Dude, wizard of [b]Land[/b]. I, like, handle things like land. And animals. Basically anything not made by man. I'm [b]all natural[/b], man. And so is [b]Land[/b], man.",
	labor = "Greetings, I am Labor Lad, wizard of [b]Labor[/b]! I'm all about [b]people and what they do[/b]. Honestly, I don't like to work much myself, but I like to watch others work!",
	snail = "This is a snail. It is your [b]land[/b] factor of production.",
	butter = "This is a butter. It is your product.",
	butter_machine = "This is the butter making machine! Put snail in, get butter out! It is your [b]capital[/b] factor of production.",
	intro = "Welcome to FACTORS OF PRODUCTION: THE GAME. Use the arrow keys to move and z or space bar to talk to people. Press z to start walking around.",
	entrepreneur = "You are a [b]Entrepreneur[/b], starting a butter making company! However, you have learned that mythical items called [i]factors of production[/i] are needed for you to be successful. To understand what they are, you have gone to consult the wise wizards of the factors of production.",
	default = "This NPCs dialogue has not been set yet."
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

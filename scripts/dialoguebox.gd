
extends Panel

var lines
export var visible = false

func _ready():
	set_size(get_parent_area_size())
	lines = get_child_count()
	hide_all_lines()
	if not visible:
		set_opacity(0)
	set_process(true)

func show_line(linenum):
	hide_all_lines()
	visible = true
	if linenum < lines:
		get_child(linenum).set("visible", true)

func hide_all_lines():
	for line in range(lines):
		get_child(line).set("visible", false)

func process(delta):
	if visible:
		set_opacity(1)
	else:
		set_opacity(0)
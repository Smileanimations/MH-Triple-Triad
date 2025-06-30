extends Panel

var boardSize = Vector2(3, 3)
var selected = Vector2(0, 0)

func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		selected = (get_local_mouse_position() / size * boardSize)
		selected = Vector2(int(selected.x), int(selected.y))
		print(selected)

	

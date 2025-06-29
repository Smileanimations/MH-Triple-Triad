extends Control

var heldDown = false
var heldOffset = Vector2(0, 0)
@onready var card = $".."

func _process(delta: float) -> void:
	if heldDown == true:
		card.position = get_global_mouse_position() + heldOffset

func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == 1 and event.pressed:
			heldDown = true
			heldOffset = card.position - get_global_mouse_position()
			card.get_parent().move_child(card, -1)
		elif event.button_index == 1 and not event.pressed:
			heldDown = false

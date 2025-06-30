extends Control

var startPosition = null
var startTreePosition = null
var heldDown = false
var heldOffset = Vector2(0, 0)
@onready var card = $".."

#Gets the position in the scene tree and on the screen so it can return to said position
func _ready():
	startTreePosition = card.get_index()
	startPosition = card.position
	print(startPosition)

#Checks every frame if the card is being held
func _process(delta: float) -> void:
	if heldDown == true:
		card.position = get_global_mouse_position() + heldOffset

#Checks for input. When a card is held down it will follow the mouse 
#until let go. After being let go it will return to its original position
func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == 1 and event.pressed:
			heldDown = true
			heldOffset = card.position - get_global_mouse_position()
			card.get_parent().move_child(card, -1)
		elif event.button_index == 1 and not event.pressed:
			heldDown = false
			card.position = startPosition
			card.get_parent().move_child(card, startTreePosition)
			print(startPosition)

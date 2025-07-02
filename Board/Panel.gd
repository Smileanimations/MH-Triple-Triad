extends Panel

var cardPositions = [
	[null, null, null],
	[null, null, null],
	[null, null, null],
]

var boardSize = Vector2(3, 3)
var selected = Vector2(0, 0)
var hover = false

@onready var highlight = $Highlight

func _ready() -> void:
	highlight.visible = false
	highlight.size = size / boardSize
	highlight.position = Vector2(0, 0)

#Checks the position of the card and creates a highlight on the square which it hovers over.
func checkPosition():
	selected = (get_local_mouse_position() / size * boardSize)
	selected = Vector2(int(selected.x), int(selected.y))
	if selected.x >= 0 and selected.x <= 2 and selected.y >= 0 and selected.y <= 2:
		highlight.position = highlight.size * selected
		highlight.visible = true
	else:
		highlight.visible = false

#Checks if the card is on the board and on a viable space.
func isOnBoard():
	if selected.x >= 0 and selected.x <= 2 and selected.y >= 0 and selected.y <= 2:
		if cardPositions[selected.y][selected.x] == null:
			return true
	highlight.visible = false
	return false

#Will snap the card to a set position on the square.
func snapCard(card):
	cardPositions[selected.y][selected.x] = card
	print(cardPositions)
	card.global_position = (selected * size / boardSize) + Vector2(33, 3)
	highlight.visible = false

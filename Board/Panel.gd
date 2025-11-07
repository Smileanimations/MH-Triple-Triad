extends Panel

@onready var instance = load("res://Deck/Deck.tscn")
@onready var board = get_parent()
@onready var highlight = $Highlight

var cardPositions = [
	[null, null, null],
	[null, null, null],
	[null, null, null],
]

var boardSize = Vector2(3, 3)
var selected = Vector2(0, 0)
var hover = false


func _ready() -> void:
	highlight.z_index = -2
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
func snapCard(card, player):
	print(player)
	card.z_index = -1
	cardPositions[selected.y][selected.x] = card
	card.global_position = (selected * size / boardSize) + Vector2(33, 3)
	highlight.visible = false
	cardPlayed(player)

#Checks every adjacent direction for a card, if there is a card it will compare values with said card
func cardPlayed(player):
	var selectedCard = cardPositions[selected.y][selected.x]
	
	var directions = [
		Vector2(0, -1),
		Vector2(1, 0),
		Vector2(0, 1),
		Vector2(-1, 0)
	]
	var opposite = [
		2,
		3,
		0,
		1,
	]
	var value = 0
	
	for direction in directions:
		var adjacentPosition = selected + direction
		
		if adjacentPosition.y <= 2 and adjacentPosition.y >= 0 and adjacentPosition.x <= 2 and adjacentPosition.x >= 0:
			if cardPositions[adjacentPosition.y][adjacentPosition.x] != null:
				var adjacentCard = cardPositions[adjacentPosition.y][adjacentPosition.x]
				print("Player: %s\n Adjacent Player: %s" % [player, adjacentCard.cardOwner])
				if player != adjacentCard.cardOwner:
					if selectedCard.values[selectedCard.monster][value] > adjacentCard.values[adjacentCard.monster][opposite[value]]:
						board.players[player]["score"] += 1
						board.players[adjacentCard.cardOwner]["score"] -= 1
						adjacentCard.nodes["Panel"].self_modulate = selectedCard.nodes["Panel"].self_modulate
						adjacentCard.cardOwner = player
		value += 1
	print(board.players)
	board.nextTurn(player)

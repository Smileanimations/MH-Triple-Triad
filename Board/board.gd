extends Control

@onready var grid = $Grid
@onready var players = [
	{"score": 0, "deck": $Deck},
	{"score": 0, "deck": $EnemyDeck}
]

func _ready():
	createDecks()

# Resets the game
func _on_button_pressed() -> void:
	grid.cardPositions = [
		[null, null, null],
		[null, null, null],
		[null, null, null],
	]
	createDecks()

func createDecks():
	for i in 2:
		var cards = players[i].deck.get_children()
		for card in cards:
			card.queue_free()
		players[i].deck.createCards(i)

func nextTurn(player):
	changeCardVisibility(player, false)
	changeCardVisibility((player + 1) % 2, true)

func changeCardVisibility(player, visibility):
	var cards = players[player].deck.get_children()
	for card in cards:
		card.get_child(1).visible = visibility
	

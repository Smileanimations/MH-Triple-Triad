extends Control

@onready var grid = $Grid
@onready var players = [
	{"score": 0, "deck": $Player/Deck},
	{"score": 0, "deck": $EnemyPlayer/Deck}
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
		players[i].score = 0
		var cards = players[i].deck.get_children()
		for card in cards:
			card.queue_free()
			players[i].deck.remove_child(card)
		print(players[i].deck.name)
		players[i].deck.createCards(i)
		players[i].score = players[i].deck.get_child_count()
		print(players[i].deck.get_children())

func nextTurn(player):
	changeCardVisibility(player, false)
	changeCardVisibility((player + 1) % 2, true)

func changeCardVisibility(player, visibility):
	var cards = players[player].deck.get_children()
	for card in cards:
		card.get_child(1).visible = visibility
	

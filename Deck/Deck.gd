extends  Control

@onready var card = preload("res://Deck/Card/Card.tscn")
@onready var container = $"."
@export var isPlayer: bool

#Sets the position of the cards, creates a new row every 5 cards
func createCards(player):
	var horizontalPosition = 0
	var verticalPosition = -100
	for i in 10:
		var cardInstance = card.instantiate()
		if i % 5 == 0:
			verticalPosition += 100
			horizontalPosition = 0
		cardInstance.position = Vector2(horizontalPosition, verticalPosition)
		cardInstance.cardSettings(player)
		container.add_child(cardInstance)
		horizontalPosition += 75

extends Control

@onready var deck = $Deck
@onready var grid = $Grid
var deckInstance = preload("res://Deck/Deck.tscn")

func _on_button_pressed() -> void:
	grid.cardPositions = [
		[null, null, null],
		[null, null, null],
		[null, null, null],
	]
	
	if deck:
		var children = deck.get_children()
		for child in children:
			deck.remove_child(child)
		deck.createCards()

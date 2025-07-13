extends  Control

@onready var card = preload("res://Deck/Card/Card.tscn")
@onready var container = $"."

func _ready():
	createCards() 

func createCards():
	var horizontalPosition = 0
	var verticalPosition = -100
	for i in 10:
		var instance = card.instantiate()
		if i % 5 == 0:
			verticalPosition += 100
			horizontalPosition = 0
		instance.position = Vector2(horizontalPosition, verticalPosition)
		container.add_child(instance)
		horizontalPosition += 75

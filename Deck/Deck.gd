extends  Control

@onready var card = preload("res://Deck/Card/Card.tscn")
@onready var container = $VBoxContainer

func _ready():
	var horizontalPosition = 0
	for i in 4:
		var instance = card.instantiate()
		instance.position = Vector2(horizontalPosition, 0)
		container.add_child(instance)
		horizontalPosition += 75

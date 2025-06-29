extends  Control

@onready var card = preload("res://Deck/Card/Card.tscn")
@onready var container = $VBoxContainer

func _ready():
	for i in 4:
		var instance = card.instantiate()
		instance.custom_minimum_size = Vector2(60, 90)
		instance.size = Vector2(40, 20)
		container.add_child(instance)
		

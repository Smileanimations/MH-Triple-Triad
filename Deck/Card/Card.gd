extends Control

# Values of each monster are as follows: Front, Right, Back, Left
var values = {
	"Rathalos": [4, 2, 3, 2],
	"Rathian": [3, 2, 4, 2],
	"Nargacuga": [1, 3, 2, 3],
	"Tigrex": [4, 2, 1, 2]
}

@onready var directions = {
	"Front": $Panel/Front,
	"Right": $Panel/Right,
	"Bottom": $Panel/Bottom,
	"Left": $Panel/Left,
}

@onready var nodes = {
	"Name": $Panel/Name,
	"Icon": $Panel/Sprite2D
}

# Called when the node enters the scene tree for the first time.
func _ready():
	pullCard(values)

# Function that pulls a card with random value
func pullCard(values):
	var monster = values.keys().pick_random()
	print(monster)
	var x = 0
	for i in values[monster]:
		var direction = directions.keys()
		directions[direction[x]].text = "%s" % i
		x += 1
	nodes["Name"].text = monster
	nodes["Icon"].texture = load("res://Sprites and what not/Icons/%s.png" % monster)

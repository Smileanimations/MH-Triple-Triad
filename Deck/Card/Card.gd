extends Control

# Values of each monster are as follows: Front, Right, Back, Left
var values = {
	"Rathalos": [4, 2, 3, 2],
	"Rathian": [3, 2, 4, 2],
	"Nargacuga": [2, 4, 2, 4],
	"Tigrex": [5, 3, 1, 3],
	"Brachydios": [4, 5, 1, 5],
	"Lagiacrus": [4, 2, 4, 2],
	"Seregios": [4, 4, 3, 4],
	"Glavenus": [4, 2, 5, 2],
	"Yian Kut-Ku": [3, 2 ,1, 2],
	"Great Jagras": [2, 1, 1, 1],
	"Paolumu": [3, 2, 3, 2]
}

@onready var directions = {
	"Front": $Panel/Front,
	"Right": $Panel/Right,
	"Bottom": $Panel/Bottom,
	"Left": $Panel/Left,
}

@onready var nodes = {
	"Name": $Panel/Name,
	"Icon": $Panel/Sprite2D,
	"Panel": $Panel
}

var monster = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pullCard(values)

# Function that pulls a card with random value
func pullCard(values):
	monster = values.keys().pick_random()
	print(monster)
	var x = 0
	for i in values[monster]:
		var direction = directions.keys()
		directions[direction[x]].text = "%s" % i
		x += 1
	nodes["Panel"].self_modulate = Color(randf(), randf(), randf() )
	nodes["Name"].text = monster
	nodes["Icon"].texture = load("res://Sprites and what not/Icons/%s.png" % monster)

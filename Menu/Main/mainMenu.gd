extends Control

var tripleTriad = preload("res://Board/Board.tscn")

func _on_button_pressed() -> void:
	get_tree().change_scene_to_packed(tripleTriad)



func _on_button_2_pressed() -> void:
	pass # Replace with function body.

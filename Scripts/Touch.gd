extends Area2D

var previous_mouse_position = Vector2()
var is_dragging = false

func _input(event):
	if is_dragging and event is InputEventScreenDrag:
		position += event.position - previous_mouse_position
		previous_mouse_position = event.position


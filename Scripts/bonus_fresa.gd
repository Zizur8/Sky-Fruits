extends RigidBody2D



func _on_VisibilityNotifier2D_screen_exited():
	if is_in_group("bonus"):
		queue_free()

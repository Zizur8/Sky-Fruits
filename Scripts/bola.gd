extends RigidBody2D


func _physics_process(delta):
	if Globals.mecanica == true:
		$AnimationPlayer.play("power")
	if Globals.mecanica == false:
		$AnimationPlayer.stop() == true


func _on_bolas_body_entered(body):
	if body.is_in_group("fresa"):
		self.position.x = rand_range(25,475)
		self.position.y = rand_range(-50,0)
		print("se separaron_las bolas")

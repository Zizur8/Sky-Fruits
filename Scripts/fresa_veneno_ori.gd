extends RigidBody2D

#scripts de la fresa veneno

func _physics_process(delta):
	if Globals.mecanica == true:
		$AnimationPlayer.play("power")
	if Globals.mecanica == false:
		$AnimationPlayer.stop() == true

extends RigidBody2D


#esta es el script de la fresa mala de la ecena

func _ready():
	$Tween.interpolate_property(
		$Sprite,
		'scale',
		$Sprite.scale,
		$Sprite.scale * 2,
		0.1,Tween.TRANS_QUINT,
		Tween.EASE_IN_OUT
	)
	#EFECTO DE ESVANECIMIENTO
	$Tween.interpolate_property(
		$Sprite,
		'modulate',
		Color(1, 1, 1, 1),
		Color(1, 1, 1, 0),
		3,Tween.TRANS_BACK,
		Tween.EASE_IN_OUT
	)

func pickup():
	$Tween.start()
	Globals.anim_perdedor = true

func _on_Tween_tween_completed(object, key):
	call_deferred("queue_free")

func _physics_process(delta):
	
	#if Globals.mecanica == true:
		#$AnimationPlayer.play("power")
	#if Globals.mecanica == false:
		#$AnimationPlayer.stop() == true
	pass

func _on_fresa_mala_body_entered(body):
	if body.is_in_group("mala"):
		self.position.x = rand_range(25,475)
		print("se separaron")


func _on_quitfresa_timeout():
	call_deferred("queue_free")

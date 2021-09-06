extends RigidBody2D

func _ready():
	randomize()
	var anim_aleatorio = randi() %3 + 1
	var anim_fase = get_node("AnimationPlayer" + str(anim_aleatorio))
	if (anim_fase != null):
		if (anim_fase == $AnimationPlayer1):
			anim_fase.play("fase1")
		if (anim_fase == $AnimationPlayer2):
			anim_fase.play("fase2")
		if (anim_fase == $AnimationPlayer3):
			anim_fase.play("fase3")

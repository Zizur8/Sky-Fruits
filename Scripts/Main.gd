extends Node2D
export (PackedScene) var BOLA
export (PackedScene) var BONUS
export (PackedScene) var MALA

onready var puntos = $Score
var posicion = Vector2()
var slow_motion = false
var a = 1

func _ready():
	randomize()
	$perdedor.visible = false
	$TextureButton.hide()
	$mancha.hide()
	$reloj.hide()
	$ParallaxBackground/ParallaxLayer/normal.show()
	$ParallaxBackground/ParallaxLayer/quinientos.hide()
	$campeon.hide()
	$button_end.hide()
	$Boss/ovni.hide()
	$luz_final.hide()
	$ovni_mensaje.hide()
	$nuevo_record.hide()
	$background_power.hide()
	$CHISPAS.hide()

func _physics_process(delta):
		#aqui donde se va hacer la camara lenta
	if slow_motion:
		if Engine.time_scale > 0.1:
			Engine.time_scale -= 4 * delta
		else:
			Engine.time_scale = 0.1
	else:
		if Engine.time_scale < 1:
			Engine.time_scale += 4 * delta
		else:
			Engine.time_scale = 1
	#------------------------


func _process(delta):
	
	puntos.text = str(Globals.score)
	
	if Globals.score >= 500 and Globals.fondo == false:
		$background.play("black")
		Globals.fondo = true
	if Globals.fondo == true and Globals.score <= 499:
		$background.play("back_black")
		Globals.fondo = false
	
	if Globals.mancha == true:
		$mancha.show()
	if Globals.mancha == false:
		$mancha.hide()
	if Globals.mecanica == true:
		$reloj.play()
		$reloj.show()
		$background_power.show()
		$background_power.play("fondo_yellow")
	
	if Globals.mecanica == true and Globals.sound == true:
		if Globals.listen_music == true:
			$sound_power.play()
		Globals.sound = false
	
	if Input.is_action_just_pressed("pausa") and Globals.muerte == false and Globals.trolleada_one == false:
		if Globals.score >= 500:
			Globals.score = 0
			Globals.trolleada_one = true
	
	if Globals.score >= 1000 and Globals.milscore == false:
		$Score.hide()
		$Boss/anim_ovni.play("fase_uno")
		$Boss/ovni.show()
		print("guardar partida: 1000")
		Globals.milscore = true
		
	if Globals.time2 >= 80:
		$Boss/anim_ovni.stop()
		$Boss/ovni.hide()
	
	
	if Globals.mensaje_pausa == true:
		$mensaje_final.play("mensaje")
		Globals.mensaje_pausa = false
	
	if Globals.muerte == true and Globals.anim_perdedor == true:
		Globals.anim_perdedor = false
		var text_aleatorio = randi() %4 + 1
		var number = str(text_aleatorio)
		var text_change = get_node("perdedor")
		if (text_change != null):
			if (number == str(1)):
				text_change.text = "¡Humillación!"
			if (number == str(2)):
				text_change.text = "¡Sigue así!"
			if (number == str(3)):
				text_change.text = "¡Muy trágico!"
			if (number == str(4)):
				text_change.text = "¡Eso no es nada!"

		$transicion_perder.play("perder")

func _on_Area2D_body_entered(body):
	if body.is_in_group("fresa") and Globals.muerte == true:
		body.queue_free()
	
	if body.is_in_group("fresa") and Globals.muerte == false and Globals.mecanica == false:
		if Globals.score >= 1 and Globals.score <= 1000:
			Globals.score -= 1
			body.queue_free()
			
		if Globals.score == 0:
			body.queue_free()
		
	if body.is_in_group("mala"):
		body.queue_free()
		
	if body.is_in_group("bonus"):
		body.queue_free()
		
	if body.is_in_group("veneno"):
		body.queue_free()
	
	if body.is_in_group("fresa_ovni"):
		body.queue_free()
	if body.is_in_group("fresa_ovni_two"):
		Globals.fresa_ovni_two_con += 1
		body.queue_free()
		if Globals.fresa_ovni_two_con >= 80:
			Globals.mensaje_pausa = true
			print("contador: " + str(Globals.fresa_ovni_two_con))


func _on_playagain_pressed():
	get_tree().change_scene("res://Ecenas/Main.tscn")
	Globals.score = 0
	Globals.quit = false
	Globals.muerte = false
	Globals.mecanica = false
	Globals.mancha = false
	Globals.fondo = false
	Globals.time = 0
	Globals.time2 = 0
	Globals.milscore = false


func _on_reloj_animation_finished():
	$reloj.stop()
	$reloj.hide()
	$background_power.hide()
	$background_power.stop()
	$sound_power.stop()


func _on_button_end_pressed():
	get_tree().change_scene("res://Ecenas/Menu.tscn")



func _on_Timer_start_timeout():
	get_tree().set_pause(false)


func _on_mensaje_final_animation_finished(anim_name):
	$mensaje_final.stop()
	Globals.mensaje_pausa = false


func _on_transicion_perder_animation_finished(anim_name):
	$transicion_perder.stop()
	$nuevo_record.show()
	Globals.guardar_partida()
	Globals.start_anim = false
	Globals.milscore = false

func _on_transicion_perder_animation_started(anim_name):
	#aqui se hace lo de la camara lenta
	if slow_motion:
		slow_motion = false
	else:
		slow_motion = true
		$slow_motion_timer.start()
	#---------------------------
		if Globals.prueba == true and Globals.nuevo_record == 0:
			$juice.play("juice")
			Globals.nuevo_record = Globals.score
			Globals.prueba = false
			Globals.seguro = true
			$nuevo_record.text = "!Nuevo Record¡"
			Globals.anim_perdedor = false
			print("1")
	#-------------------------------------------
		if Globals.nuevo_record < int(puntos.text):
			$juice.play("juice")
			Globals.nuevo_record = Globals.score
			$nuevo_record.text = "!Nuevo Record¡"
			Globals.anim_perdedor = false
			print("2")
	#-------------------------------------------
		if Globals.nuevo_record > int(puntos.text):
			$nuevo_record.text = "Mejor Record " + str(Globals.nuevo_record)
			print("3")
			Globals.anim_perdedor = false
	#-------------------------------------------
		if Globals.nuevo_record == int(puntos.text):
			if(!$nuevo_record.text == "!Nuevo Record¡"):
				$nuevo_record.text = "Record No Superado"
				print("4")
				Globals.anim_perdedor = false
	#-------------------------------------------



func _on_juice_animation_finished(anim_name):
	$juice.stop()


func _on_slow_motion_timer_timeout():
	slow_motion = false


func _on_sound_power_finished():
	$sound_power.stop()

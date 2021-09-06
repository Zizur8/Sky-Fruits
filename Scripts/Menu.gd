extends Control
#Menu

onready var audio = $AudioStreamPlayer

func _ready():
	randomize()
	Globals.cargar_partida()
	OS.center_window()
	preload("res://sounds/musica de fondo del player.wav")
	preload("res://Ecenas/Main.tscn")
	Globals.mecanica = false
	Globals.quit = false
	Globals.score = 0
	Globals.muerte = false
	Globals.mancha = false
	Globals.fondo = false
	Globals.time = 0
	Globals.time2 = 0
	Globals.milscore = false
	
	print("Este es el record_max: " , Globals.nuevo_record)
	print("Este es la prueba: " , Globals.prueba)
	$Popup/quit_music.pressed = Globals.listen_music
	$Popup/CheckButton.pressed = Globals.show_fps_mb
	$sprites_Extras/score_coron.text = str(Globals.nuevo_record)
	
	var text_aleatorio = randi() %3 + 1
	var number = str(text_aleatorio)
	var text_change = get_node("mensaje")
	if (text_change != null):
		if (number == str(1)):
			text_change.text = "¿¡Puedes llegar al score 1000!?"
			
		if (number == str(2)):
			text_change.text = "¿Buscaste los secretos ocultos?"
			
		if (number == str(3)):
			text_change.text = "¡Oprime la tecla P ,sube el score!"

func _process(delta):
	pass
func _on_button_play_pressed():
	if $Popup.visible == true:
		return
	else:
		if Globals.listen_music == true:
			audio.play()
		get_tree().change_scene("res://Ecenas/Main.tscn")
	if Globals.prueba == false and Globals.seguro == false:
		Globals.prueba = true
func _on_button_exit_pressed():
	if $Popup.visible == true:
		return
	else:
		if Globals.listen_music == true:
			audio.play()
		get_tree().quit()



func _on_settings_pressed():
	if Globals.listen_music == true:
		audio.play()
	$Popup.visible = !$Popup.visible


func _on_CheckButton_toggled(button_pressed):
	if $Popup/CheckButton.toggle_mode == button_pressed:
		Globals.show_fps_mb = true
		_guardar_cambios()
	if $Popup/CheckButton.toggle_mode != button_pressed:
		Globals.show_fps_mb = false
		_guardar_cambios()


func _on_quit_music_toggled(button_pressed):
	if $Popup/CheckButton.toggle_mode == button_pressed:
		Globals.listen_music = true
		_guardar_cambios()
	if $Popup/CheckButton.toggle_mode != button_pressed:
		Globals.listen_music = false
		_guardar_cambios()

func _guardar_cambios():
	Globals.guardar_partida()

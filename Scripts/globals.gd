extends Node

var score = 0
var mecanica = false
var muerte = false
var quit = false
var mancha = false
var fondo = false
var time = 0
var time2 = 0
var final = false
var mensaje = false
var milscore = false

var fresa_ovni_two_con = 0 #contar para cinematica final 

#settings---------------------
var show_fps_mb = false
var listen_music = true #es para escuchar musica y desactivarla
#settings--------------------

var sound = false

var start_anim = false

#este es para mostrar el label y boton cuando pierdes
var anim_perdedor = false
#Cuando se muestra el mensaje final esta sirve para detener la animacion
var mensaje_pausa = false
#sirve para guardar el record y mostrarlo
var record = 0
#esta variable es la que se muestra cuando es un nuevo record
var nuevo_record = 0

var prueba = false
var seguro = false

var trolleada_one = false#es la tecla p el trol ,score = 0

var laser_shot = false


#-----------Script de guardar y carga datos--------------

var datos_partida ={
	nuevo_record = 0,
	prueba = false,
	seguro = false,
	trolleada_one = false,
	show_fps_mb = false,
	listen_music = false
}

func _ready():
	var path = Directory.new()
	if(!path.dir_exists("user://datos")):
		path.open("user://")
		path.make_dir("user://datos")


func guardar_partida():
	var save = File.new()
	save.open("user://datos" + ".sav" , File.WRITE)

	var datos_guardar = datos_partida
	datos_guardar.nuevo_record = nuevo_record
	datos_guardar.prueba = prueba
	datos_guardar.seguro = seguro
	datos_guardar.trolleada_one = trolleada_one
	datos_guardar.show_fps_mb = show_fps_mb
	datos_guardar.listen_music = listen_music

	save.store_line(to_json(datos_guardar))
	save.close()

func cargar_partida():
	var cargar = File.new()
	if(!cargar.file_exists("user://datos" + ".sav")):
		print("No hay partidas guardadas")
		return

	cargar.open("user://datos" + ".sav", File.READ)

	var datos_cargar = datos_partida

	if(!cargar.eof_reached()):
		var datos_provis = parse_json(cargar.get_line())
		if(datos_provis != null):
			datos_cargar = datos_provis
	cargar.close()

	nuevo_record = datos_cargar.nuevo_record
	prueba = datos_cargar.prueba
	seguro = datos_cargar.seguro
	trolleada_one = datos_cargar.trolleada_one
	show_fps_mb = datos_cargar.show_fps_mb
	listen_music = datos_cargar.listen_music

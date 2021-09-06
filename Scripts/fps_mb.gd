extends HBoxContainer

func _process(delta):
	if Globals.show_fps_mb == true:
		$L_fps_mb.show()
		$L_fps_mb.text = "FPS: " + str(Performance.get_monitor(Performance.TIME_FPS)) + "MB: " + str(round(Performance.get_monitor(Performance.MEMORY_STATIC)/1024/1024))
	else:
		$L_fps_mb.hide()
		$L_fps_mb.text = ""

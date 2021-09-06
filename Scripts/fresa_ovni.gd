extends Position2D

export(PackedScene) var Fresa
var t = Timer.new()
var new_fresas = false

func _ready():
	randomize()
	t.connect("timeout",self,"_on_Timer_timeout")
	t.autostart = true
	t.wait_time = 1.75
	t.one_shot = true
	add_child(t)

func _process(delta):
	if Globals.score >= 1000 and new_fresas == true:
		var randix = randi() %500 + 1
		var fresa_new = Fresa.instance()
		get_tree().get_nodes_in_group("main")[0].add_child(fresa_new)
		fresa_new.global_position = global_position
		fresa_new.position.x = randix
		fresa_new.position.x = rand_range(125,125)
		new_fresas = false
		t.start()
		if Globals.quit and Globals.muerte == true:
			Globals.time += 0
		else:
			Globals.time += 1

func _on_Timer_timeout():
	if Globals.time == 24:
		new_fresas = false
	else:
		new_fresas = true

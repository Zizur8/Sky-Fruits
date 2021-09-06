extends Position2D

export (PackedScene) var BOLA

var t = Timer.new()

func _ready():
	randomize()
	t.connect("timeout",self,"_on_timer")
	t.autostart = true
	add_child(t)


func _on_timer():
	var randix = randi() % 500 + 1
	var bola_new = BOLA.instance()
	get_tree().get_nodes_in_group("main")[0].add_child(bola_new)
	bola_new.global_position = global_position
	bola_new.position.x = randix
	bola_new.position.x = rand_range(25,475)

func _process(delta):
	if Globals.score >= 1000:
		t.stop()
	if Globals.score <= 50:
		t.wait_time = 0.3
	if Globals.score >= 50 and Globals.score <= 100:
		t.wait_time = 0.4
	if Globals.score >= 101 and Globals.score <= 200:
		t.wait_time = 0.3
	if Globals.score >= 200 and Globals.score <= 250:
		t.wait_time = 0.4
	if Globals.score >= 300 and Globals.score <= 350:
		t.wait_time = 0.3
	if Globals.score >= 400 and Globals.score <= 600:
		t.wait_time = 0.4

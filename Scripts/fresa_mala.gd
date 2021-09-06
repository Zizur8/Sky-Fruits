extends Position2D

export (PackedScene) var MALA

var t = Timer.new()

func _ready():
	randomize()
	t.connect("timeout",self, "_on_timer")
	t.autostart = true
	add_child(t)

func _on_timer():
	var randix = randi() % 50 + 1
	var fresa_mala = MALA.instance()
	get_tree().get_nodes_in_group("main")[0].add_child(fresa_mala)
	fresa_mala.global_position = global_position
	fresa_mala.position.x = randix
	fresa_mala.position.x = rand_range(25,475)


func _process(delta):
	if Globals.score >= 1000:
		t.stop()
	if Globals.score <= 50:
		t.wait_time = 1.5
	if Globals.score >= 50 and Globals.score <= 100:
		t.wait_time = 1
	if Globals.score >= 101:
		t.wait_time = 0.6
	if Globals.score >= 200:
		t.wait_time = 0.4

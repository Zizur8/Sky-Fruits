extends Position2D

export (PackedScene) var VENENO


var t = Timer.new()

func _ready():
	randomize()
	t.connect("timeout",self, "_on_timer")
	t.autostart = true
	add_child(t)

func _on_timer():
	var randix = randi() % 500 + 1
	var fresa_veneno = VENENO.instance()
	get_tree().get_nodes_in_group("main")[0].add_child(fresa_veneno)
	fresa_veneno.global_position = global_position
	fresa_veneno.position.x = randix
	fresa_veneno.position.x = rand_range(25,480)
	
func _process(delta):
	if Globals.score >= 1000:
		t.stop()
	if Globals.score <= 50:
		t.wait_time = 16
	if Globals.score >= 50 and Globals.score <= 100:
		t.wait_time = 16
	if Globals.score >= 101 and Globals.score <= 300:
		t.wait_time = 16
	if Globals.score >= 301 and Globals.score <= 500:
		t.wait_time = 11

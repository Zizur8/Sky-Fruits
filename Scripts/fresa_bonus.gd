extends Position2D

export (PackedScene) var BONUS

var t = Timer.new()

func _ready():
	t.connect("timeout",self,"_nueva_bonus")
	t.autostart = true
	add_child(t)


func _nueva_bonus():
	var randix = randi() % 500 + 1
	var fresa_bonus = BONUS.instance()
	get_tree().get_nodes_in_group("main")[0].add_child(fresa_bonus)
	fresa_bonus.global_position = global_position
	fresa_bonus.position.x = randix
	fresa_bonus.position.x = rand_range(25,480)

func _process(delta):
	if Globals.score >= 1000:
		t.stop()
	if Globals.score <= 49:
		t.wait_time = 24
	if Globals.score >= 50 and Globals.score <= 100:
		t.wait_time = 28
	if Globals.score >= 101:
		t.wait_time = 34

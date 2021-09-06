extends ParallaxBackground

var off = 0

func _ready():
	set_process(true)
	$ParallaxLayer/normal.show()

func _process(delta):
	if Globals.score >= 500:
		off -= 120 * delta
		set_scroll_offset(Vector2(0,off))
	elif Globals.score <= 499:
		off -= 150 * delta
		set_scroll_offset(Vector2(0,off))

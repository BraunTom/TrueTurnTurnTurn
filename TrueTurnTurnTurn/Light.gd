enum Colors {WHITE, ORANGE, RED, YELLOW, BLUE, GREEN}

static func get_light_color(index):
	var lightColorArray = [
		Color("#ffffff"),
		Color("#ff7e00"),
		Color("#ff0000"),
		Color("#fdff00"),
		Color("#1400ff"),
		Color("#4aff00")
	]
	return lightColorArray[index]

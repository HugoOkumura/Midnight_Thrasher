extends Timer

@onready var arma = $".."

func setup():
	wait_time = arma.current_arma.shoot_time
	print(wait_time)
	one_shot = true
	autostart = false

extends State
class_name InimigoMorte

@onready var ani_sprite = $"../../AnimatedSprite2D"

var death_ani = ["morte_1", "morte_2", "morte_3"]

func Enter(_args):
	var death = int(randf_range(0, 3))
	ani_sprite.play(death_ani[death])


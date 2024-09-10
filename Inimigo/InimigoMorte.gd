extends State
class_name InimigoMorte

@onready var ani_sprite = $"../../AnimatedSprite2D"
@onready var inimigo = $"../.."
@onready var corpo = load("res://Inimigo/InimigoMorto.tscn")

var death_ani = ["morte_1", "morte_2", "morte_3"]

func Enter(_args):
	var death = int(randi_range(0, 2))
	#ani_sprite.play(death_ani[death])
	var corpo_instance = corpo.instantiate()
	corpo_instance.global_position = inimigo.global_position
	corpo_instance.rotation = inimigo.rotation
	corpo_instance.sprite_name = death_ani[death]

	Global.reduce_enemy_count()
	print("enemy left: ",Global.enemy)
	get_tree().current_scene.call_deferred("add_child", corpo_instance)
	inimigo.queue_free()


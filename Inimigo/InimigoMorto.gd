extends Node2D

@onready var sprites = $sprites
var sprite_name : String

func _ready():
	z_index = 1
	sprites.play(sprite_name)
	print(sprites)

#func play_sprite(sprite_name: String):
	#z_index = 1
	#sprites.play(sprite_name)

extends Node2D

var sprit_name: String
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var drop = $"."

func _ready():
	z_index = 0
	animated_sprite_2d.visible = true

func equip_item(item_name: String):
	animated_sprite_2d.play(item_name)




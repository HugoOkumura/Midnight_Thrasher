extends Node2D
class_name StateBoss

@onready var player = owner.get_parent().find_child('Player')
@onready var label = owner.find_child('Label')
@onready var animated_sprite_Body = $SpriteCorpo/AnimatedSprite2D
@onready var animated_sprite_leg = $SpriteCorpo/Pernas/AnimatedSprite2D


func _ready():
	set_physics_process(false)

func enter():
	set_physics_process(true)

func exit():
	set_physics_process(false)
	
func transition():
	pass
	
func _physics_process(_delta):
	transition()
	label.text = name

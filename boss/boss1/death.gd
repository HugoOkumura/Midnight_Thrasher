extends StateBoss
class_name deathState

@onready var sprite_corpo = $"../../SpriteCorpo"
@onready var dano = $"../../dano"
@onready var area_2d = $"../../Area2D"
@onready var sprite_morto = $"../../SpriteMorto"
@onready var deathSound = $"../../Death"

# Called when the node enters the scene tree for the first time
var transition_wait = false



func transition():
	pass
		
func enter():
	super.enter()
	area_2d.queue_free()
	sprite_corpo.visible = false
	sprite_morto.visible = true
	deathSound.play(0.0)

func exit():
	super.exit()
	
func process_state(_delta):
	pass
	

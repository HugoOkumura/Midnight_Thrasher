extends StateBoss
class_name deathStateBoss2

@onready var sprite_corpo = $"../../SpriteCorpo"
@onready var sprite_morto = $"../../SpriteMorto"
@onready var deathSound = $"../../Death"
@onready var collision_shape_2d = $"../../CollisionShape2D"

# Called when the node enters the scene tree for the first time
var transition_wait = false



func transition():
	pass
		
func enter():
	super.enter()
	sprite_corpo.visible = false
	sprite_morto.visible = true
	deathSound.play(0.0)
	collision_shape_2d.queue_free()
	

func exit():
	super.exit()
	
func process_state(_delta):
	pass
	

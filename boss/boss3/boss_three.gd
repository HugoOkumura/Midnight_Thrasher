extends CharacterBody2D

@export var player: CharacterBody2D
@onready var animatedBody = $SpriteCorpo/AnimatedSprite2D
@onready var animatedLeg = $SpriteCorpo/Pernas/AnimatedSprite2D
@onready var sprite_corpo = $SpriteCorpo
@onready var finite_state_machine = $FiniteStateMachine

var hp = 3
var direcVector = Vector2(-1.0,0.0)
var direcao = Vector2(0,0)
var _direction: Vector2 = Vector2.ZERO
var velocidade = 200
var direction = Vector2.RIGHT



func _ready():
	await get_tree().create_timer(0.05).timeout
	player = owner.find_child('Player')
	set_physics_process(true)



func _process(_delta):
	pass


func got_hit(dmg:int):
	hp -= dmg
	if hp <= 0:
		find_child('FiniteStateMachine').change_state('death')


#func _on_dano_area_entered(area):
	#if area.is_in_group("DanoArma"):
		#hp -= 1
		#if hp == 0:
			#find_child('FiniteStateMachine').change_state('death') 

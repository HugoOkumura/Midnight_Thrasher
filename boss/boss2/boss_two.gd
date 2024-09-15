extends CharacterBody2D

@export var player: CharacterBody2D
@onready var animatedBody = $SpriteCorpo/AnimatedSprite2D
@onready var animatedLeg = $SpriteCorpo/Pernas/AnimatedSprite2D
@onready var sprite_corpo = $SpriteCorpo
@onready var finite_state_machine = $FiniteStateMachine
@onready var boss_fase_2 = $".."

var hp = 12
var direcVector = Vector2(-1.0,0.0)
var direcao = Vector2(0,0)
var _direction: Vector2 = Vector2.ZERO
var velocidade = 200
var direction = Vector2.RIGHT



func _ready():
	boss_fase_2.connect("player_setted", on_player_setted)



func _process(_delta):
	pass




func got_hit(dmg:int):
	hp -= dmg
	if hp <= 0:
		find_child('FiniteStateMachine').change_state('death') 

func on_player_setted():
	player = get_tree().get_first_node_in_group("Jogador")
	set_physics_process(true)

extends CharacterBody2D


@onready var ray_cast = $RayCast2D
@export var player: CharacterBody2D
@onready var animatedBody = $SpriteCorpo/AnimatedSprite2D
@onready var animatedLeg = $SpriteCorpo/Pernas/AnimatedSprite2D
@onready var sprite_corpo = $SpriteCorpo
@onready var finite_state_machine = $FiniteStateMachine
@onready var boss_fase_1 = $".."

var hp = 12
var direcVector = Vector2(-1.0,0.0)
var direcao = Vector2(0,0)
var _direction: Vector2 = Vector2.ZERO
var velocidade = 150
var direction = Vector2.RIGHT

var dict_animation = {
	"Idle": false,
	"Follow": false,
}


func _ready():
	#await _on_boss_fase_1_player_setted
	#player = owner.find_child('Player')
	#set_physics_process(true)
	boss_fase_1.connect("player_setted", on_player_setted)

func _process(_delta):
	pass

func setAnimation(animationName: String):
	for i in dict_animation:
		if i == animationName:
			print(animationName, 'teste', i )
			dict_animation[i] = true
		else:
			dict_animation[i] = false
	#wwwchoiseAnimation()		
	
func choiseAnimation():
	if dict_animation['Idle']:
		Setanimacaorun()
	elif dict_animation['Follow']:
		Setanimacaorun()
		
func Setanimacaorun():
	animatedBody.play('run')
	animatedLeg.play('run_leg')
	
func Setanimacaoidle():
	animatedBody.play('Idle')
	animatedLeg.play('Idle_leg')


func got_hit(dmg:int):
	hp -= dmg
	if hp <= 0:
		find_child('FiniteStateMachine').change_state('death') 

func on_player_setted():
	player = get_tree().get_first_node_in_group("Jogador")
	set_physics_process(true)



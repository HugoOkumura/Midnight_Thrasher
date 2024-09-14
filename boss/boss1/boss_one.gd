extends CharacterBody2D


@onready var ray_cast = $RayCast2D
@export var player: CharacterBody2D
@onready var animatedBody = $SpriteCorpo/AnimatedSprite2D
@onready var animatedLeg = $SpriteCorpo/Pernas/AnimatedSprite2D
@onready var sprite_corpo = $SpriteCorpo
@onready var finite_state_machine = $FiniteStateMachine

var hp = 6
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
	
	set_physics_process(true)



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

#func _on_dano_area_entered(area):
	#if area.is_in_group("DanoArma"):
		#hp -= 1
		#if hp == 0:
			#find_child('FiniteStateMachine').change_state('death') 
	#
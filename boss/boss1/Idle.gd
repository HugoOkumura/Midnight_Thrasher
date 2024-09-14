extends StateBoss
class_name IdleState

@onready var timer_2 = $"../../Timer2"

var transicao = false

func transition():
	if transicao:
		get_parent().change_state('Follow')

func enter():
	super.enter()
	timer_2.start()
	
func exit():
	super.exit()
	transicao = false
	timer_2.stop()	
	
func process_state(_delta):
	owner.animatedBody.play('run')
	owner.animatedLeg.play('run_leg')
	if owner.position.x < 200:
		owner.direcVector = Vector2(1.0,0.0)
	elif owner.position.x >  800:
		owner.direcVector =Vector2(-1.0,0.0)
		
	owner.velocity = owner.direcVector * owner.velocidade
	# Calcule a direção do owner em relação ao player
	var direcao = (owner.player.position - owner.position).normalized()

	# Converta essa direção para um ângulo
	var angulo = direcao.angle()

	# Defina a rotação do owner para esse ângulo
	owner.rotation = angulo - PI / 2 # Ajuste de 90 graus
	owner.move_and_slide()

func _on_timer_2_timeout():
	transicao = true

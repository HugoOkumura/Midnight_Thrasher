extends StateBoss
class_name IdleStateBos2

@onready var fireTime = $"../../Fire"


var transicao = false

func transition():

	if transicao:
		get_parent().change_state('Fire')

func enter():
	super.enter()
	fireTime.start()

func exit():
	super.exit()
	transicao = false
	transicao = false
	fireTime.stop()	


func process_state(_delta):
	owner.animatedBody.play('Run')
	owner.animatedLeg.play('runleg')
	if owner.position.x < 300:
		owner.direcVector = Vector2(1.0,0.0)
		
	elif owner.position.x >  700:
		owner.direcVector =Vector2(-1.0,0.0)
		
	owner.velocity = owner.direcVector * owner.velocidade
	# Calcule a direção do owner em relação ao player
	var direcao = (owner.player.position - owner.position).normalized()

	# Converta essa direção para um ângulo
	var angulo = direcao.angle()

	# Defina a rotação do owner para esse ângulo
	owner.rotation = angulo # Ajuste de 90 graus
	owner.move_and_slide()

	
	
	


func _on_fire_timeout():
	transicao = true

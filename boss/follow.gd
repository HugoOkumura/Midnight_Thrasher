extends StateBoss
class_name FollowState
@onready var timer = $"../../Timer"

var aux_direcao = Vector2.ZERO
var bateu = false
var transicao = false
var player_direcao = Vector2.ZERO
func transition():
	if owner.position.distance_to(aux_direcao) <= 15:
		get_parent().change_state('Idle')


		
func enter():
	super.enter()

	player_direcao = owner.player.position 
	aux_direcao = owner.position

func exit():
	super.exit()
	timer.stop()
	transicao = false
	bateu = false

func process_state(_delta):
	owner.animatedBody.play('run')
	owner.animatedLeg.play('run_leg')
	
	if bateu:
		owner.direcao = (aux_direcao - owner.global_position).normalized()
	else:
		owner.direcao = (player_direcao - owner.global_position).normalized()
	
	if owner.position.distance_to(player_direcao) <= 15:
		bateu = true
		
	
	owner.velocity = owner.direcao * owner.velocidade * 2
	# Calcule a direção do owner em relação ao player
	var direcao = (owner.player.position - owner.position).normalized()

	# Converta essa direção para um ângulo
	var angulo = direcao.angle()

	# Defina a rotação do owner para esse ângulo
	owner.rotation = angulo - PI / 2 # Ajuste de 90 graus
	owner.move_and_slide()
	
	

func _on_area_2d_body_entered(body):
	if body.get_name() == "Player":
		timer.start()
		bateu = true
	


func _on_timer_timeout():
	pass

extends StateBoss
class_name FireStateBos2
@onready var fire_reload = $"../../FireReload"
@onready var arma = $"../../Arma"
@onready var tiroSound = $"../../Tiro"
@onready var reloadSound = $"../../Reload"


var fireTime = 3
var transicao = false


func transition():
	if fireTime <= 0:
		get_parent().change_state('Idle')

func enter():
	super.enter()
	fire_reload.start()
	reloadSound.play()

func exit():
	super.exit()
	transicao = false
	fire_reload.stop()
	
	fireTime = 3

	
	

func process_state(_delta):
	owner.animatedBody.play('fire')
	owner.animatedLeg.play('idleleg')
	owner.velocity = Vector2.ZERO

	var direcao = (owner.player.position - owner.position).normalized()

	# Converta essa direção para um ângulo
	var angulo = direcao.angle()

	# Defina a rotação do owner para esse ângulo
	owner.rotation = angulo# Ajuste de 90 graus
	owner.move_and_slide()


func _on_fire_reload_timeout():
	fireTime -= 1
	reloadSound.stop()
	tiroSound.play(0.0)
	arma.fire()
	

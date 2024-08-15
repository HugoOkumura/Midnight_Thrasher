extends State
class_name InimigoPatrulha

@onready var caminho : PathFollow2D = $"../../../../PathFollow2D"
@export var inimigo: CharacterBody2D
@export var speed:= 150
@export var jogador: CharacterBody2D = null

func Enter(args):
	caminho.progress = 0.0
	caminho.loop = true
	caminho.cubic_interp = true
	caminho.rotates = true
	inimigo.velocity = inimigo.global_position
	#pass
	
func Physics_Update(delta: float):
	caminho.progress += speed * delta
	
	if jogador != null:
		Transitioned.emit(self, "InimigoSeguir", jogador)
#	pass

func _on_visao_jogador_encontrado(body):
	if body.is_in_group("Jogador"):
		jogador = body
	#pass

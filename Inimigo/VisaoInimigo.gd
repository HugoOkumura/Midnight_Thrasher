extends Area2D

signal jogador_encontrado()

func _on_body_entered(body):
	if body.is_in_group("Jogador"):
		jogador_encontrado.emit(body) # Replace with function body.



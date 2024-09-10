extends Area2D

@export var proxima_cena : String

func _on_body_entered(body):
	if Global.phase_clear && body is Jogador:
		SceneManager.change_scene(get_owner(), proxima_cena)

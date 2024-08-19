extends Sprite2D

var mov = Vector2(1, 0)
var velocidade = 400
var direção_unica = true


func _process(delta: float) -> void:
	if direção_unica:
		look_at(get_global_mouse_position())
		direção_unica = false
	global_position += mov.rotated(rotation) * velocidade * delta

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


func _on_hitbox_body_entered(body):
	if body.is_in_group("Inimigo") and !body.is_in_group("Morto"):
		body.got_hit()
		queue_free()
		body.add_to_group("Morto")
		print(Global.enemy)
		Global.enemy -= 1
		if Global.enemy <= 0:
			Global.enemy = 3
			get_tree().change_scene_to_file("res://endgame/endgame.tscn")

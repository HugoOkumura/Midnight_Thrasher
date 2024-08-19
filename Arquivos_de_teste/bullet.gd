extends Sprite2D

var mov = Vector2(1, 0)
var velocidade = 800
var direção_unica = true
var shooter : CharacterBody2D

func _process(delta: float) -> void:
	if direção_unica:
		look_at(get_global_mouse_position())
		direção_unica = false
	global_position += mov.rotated(rotation) * velocidade * delta

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

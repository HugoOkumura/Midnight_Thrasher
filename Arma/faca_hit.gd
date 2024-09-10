extends Area2D
class_name Faca_hit

var shooter
var time_elapsed: float = 0
var live_time := 0.3

func set_shooter(shot):
	shooter = shot

func _process(delta):
	time_elapsed += delta
	if time_elapsed >= live_time:
		queue_free()


func _on_body_entered(body):
	if body == null:
		return
	if body is Jogador and shooter.is_in_group("Inimigo"):
		body.got_hit(1)
		queue_free()
	if body.is_in_group("Inimigo") and shooter is Jogador:
		body.got_hit(1)
		queue_free()

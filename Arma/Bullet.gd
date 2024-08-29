extends Area2D
class_name Bullet

@export var speed = 200

var shooter
var _velocity := Vector2(800,0)

func set_velocity(vel_x: float, vel_y: float) -> void:
	_velocity = Vector2(vel_x, vel_y)

func set_shooter(shot):
	shooter = shot

func _process(delta):
	global_position += (_velocity * delta).rotated(rotation)
	

func _on_body_entered(body:CharacterBody2D):
	if body is Jogador and shooter is Inimigo:
		body.got_hit(2)
		queue_free()
	if body is Inimigo and shooter is Jogador:
		body.got_hit(2)
		queue_free()

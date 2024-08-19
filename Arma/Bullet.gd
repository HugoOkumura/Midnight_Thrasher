extends Area2D
class_name Bullet

@export var speed = 200

var shooter : CharacterBody2D
var _velocity := Vector2(800,0)

func set_velocity(vel_x: float, vel_y: float) -> void:
	_velocity = Vector2(vel_x, vel_y)

func set_shooter(shot: CharacterBody2D):
	shooter = shot

func _process(delta):
	global_position += (_velocity * delta).rotated(rotation)
	

#func _on_area_entered(area):
	#queue_free()
	

func _on_body_entered(body:CharacterBody2D):
	if body.is_in_group("Jogador") and shooter.is_in_group("Inimigo"):
		queue_free()
	if body.is_in_group("Inmigo") and shooter.is_in_group("Jogador"):
		body.got_hit()

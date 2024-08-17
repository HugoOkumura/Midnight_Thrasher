extends Node2D
class_name Arma

@onready var inimigo = $".."
@onready var projectile = load("res://Arma/Bullet.tscn")
@onready var bullet_point = $"Bullet Point"
@onready var forward = $Forward

var parent: CharacterBody2D
var shoot_time = 3
var bullets_per_shot = 1
var aperture_angle = 0
var shot_distance = 200

func _create_bullet(direction: float, shooter: CharacterBody2D) -> void:
	var instance = projectile.instantiate()
	# setup bullet
	instance.set_shooter(shooter)
	instance.global_position = bullet_point.global_position

	instance.rotation = direction	

	get_tree().get_root().get_child(0).call_deferred("add_child", instance)
	

func fire_bullet(shooter: CharacterBody2D) -> void:
	var direction: float = (forward.global_position - global_position).angle()
	direction -= aperture_angle/2
	
	var offset: float = 0
	if bullets_per_shot > 1:
		offset = aperture_angle / (bullets_per_shot-1)
	
	for i in range(bullets_per_shot):
		_create_bullet(direction + offset*i, shooter)

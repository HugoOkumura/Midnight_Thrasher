extends Arma
class_name Faca

@onready var hitbox = load("res://Arma/faca_hit.tscn")
@onready var bullet_point = $"../Bullet Point"
@onready var forward = $"../Forward"
@onready var tempo_entre_tiros = $"../tempo entre tiros"
@onready var arma = $".."

func set_arma_params():
	shoot_time = 0.5
	shot_distance = 32
	bullets_per_shot = 0
	aperture_angle = 0
	damage = 1
	can_shoot = true
	combo_time = 6
	tempo_entre_tiros.setup()

func _create_bullet(direction: float) -> void:
	var instance  = hitbox.instantiate()
	instance.set_shooter(arma.get_shooter())
	instance.global_position = bullet_point.global_position
	instance.rotation = direction
	#get_parent().add_child(instance)
	get_tree().current_scene.call_deferred("add_child", instance)
	
func fire_bullet() -> void:
	can_shoot = false
	print("Faca: swing")
	var direction: float = (forward.global_position - global_position).angle()
	direction -= aperture_angle/2
	_create_bullet(direction)
	
	tempo_entre_tiros.start()

func _on_tempo_entre_tiros_timeout():
	can_shoot = true

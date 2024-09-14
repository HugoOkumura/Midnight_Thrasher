extends Arma
class_name  Pistola

@onready var projectile = load("res://Arma/Bullet.tscn")
@onready var bullet_point = $"../Bullet Point"
@onready var forward = $"../Forward"
@onready var tempo_entre_tiros = $"../tempo entre tiros"
@onready var arma = $".."
@onready var pistola = $"../pistola"


func set_arma_params():
	shoot_time = 0.7
	shot_distance = 100
	bullets_per_shot = 1
	aperture_angle = 0
	damage = 2
	can_shoot = true
	combo_time = 3
	if arma.get_shooter() is Jogador:
		municao = 7
	
	tempo_entre_tiros.setup()
	
func _create_bullet(direction: float) -> void:
	var instance = projectile.instantiate()
	# setup bullet
	instance.set_shooter(arma.get_shooter())
	instance.global_position = bullet_point.global_position

	instance.rotation = direction
	#print(get_parent().name)
	#get_parent().add_child(instance)
	get_tree().current_scene.call_deferred("add_child", instance)

func fire_bullet() -> void:
	can_shoot = false
	print("Pistola: pew")
	pistola.play()
	var direction: float = (forward.global_position - global_position).angle()
	
	_create_bullet(direction)
	
	if arma.get_shooter() is Jogador and no_ammo():
		tempo_entre_tiros.stop()
		arma.change_arma("Faca")
	else:
		tempo_entre_tiros.start()

func get_shot_distance() -> float:
	return shot_distance

func get_shoot_time() -> float:
	return shoot_time

func _on_tempo_entre_tiros_timeout():
	pistola.stop()
	can_shoot = true

func no_ammo() -> bool:
	municao -= 1
	if municao == 0:
		return true
	else: return false

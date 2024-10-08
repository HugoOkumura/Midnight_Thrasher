extends Arma
class_name Shotgun

@onready var projectile = load("res://Arma/Bullet.tscn")
@onready var bullet_point = $"../Bullet Point"
@onready var forward = $"../Forward"
@onready var tempo_entre_tiros = $"../tempo entre tiros"
@onready var arma = $".."
@onready var shtgn_time = $"shtgn time"
@onready var shotgun = $"../shotgun"

var bllt := true

func set_arma_params():
	shoot_time = 1
	shot_distance = 150
	bullets_per_shot = 3
	aperture_angle = deg_to_rad(90)
	damage = 2
	can_shoot = true
	combo_time = 2
	if arma.get_shooter() is Jogador:
		municao = 2
	shtgn_time.wait_time = 0.03
	tempo_entre_tiros.setup()

func _create_bullet(direction: float) -> void:
	var instance = projectile.instantiate()
	# setup bullet
	instance.set_shooter(arma.get_shooter())
	instance.global_position = bullet_point.global_position

	instance.rotation = direction

	get_tree().current_scene.call_deferred("add_child", instance)

func fire_bullet() -> void:
	can_shoot = false
	print("Shotgun: pew")
	shotgun.play()
	var direction: float = (forward.global_position - global_position).angle()
	
	var offset: float = 0
	var current_recoil := 0.0
	var recoil_increment = aperture_angle * 0.1
	for i in range(bullets_per_shot):
		offset = randf_range(-(current_recoil/2), (current_recoil/2))
		current_recoil = clampf(current_recoil + recoil_increment, 0, aperture_angle)
		#bllt = false
		_create_bullet(direction + offset)
		shtgn_time.start()
		await shtgn_time.timeout
	
	if arma.get_shooter() is Jogador and no_ammo():
		tempo_entre_tiros.stop()
		arma.change_arma("Faca")
	else:
		tempo_entre_tiros.start()

func _on_tempo_entre_tiros_timeout():
	shotgun.stop()
	can_shoot = true

#func _on_shtgn_time_timeout():
	#bllt = true

func no_ammo() -> bool:
	municao -= 1
	if municao == 0:
		return true
	else: return false

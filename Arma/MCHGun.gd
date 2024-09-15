extends Arma
class_name MCHGun

@onready var projectile = load("res://Arma/Bullet.tscn")
@onready var bullet_point = $"../Bullet Point"
@onready var forward = $"../Forward"
@onready var tempo_entre_tiros = $"../tempo entre tiros"
@onready var arma = $".."
@onready var mchgun = $"../mchgun"


var current_recoil := 0.0
#var municao := 12
var recarregando := 0.0
var carregado := true

func _physics_process(delta):
	if not carregado:
		recarregando += delta
		current_recoil = 0.0
	
	if recarregando >= 2:
		carregado = true
		can_shoot = true
		recarregando = 0
		municao = 12

func set_arma_params():
	shoot_time = 0.1
	shot_distance = 250
	bullets_per_shot = 1
	aperture_angle = deg_to_rad(30)
	damage = 2
	municao = 12
	can_shoot = true
	combo_time = 1
	tempo_entre_tiros.setup()

func _create_bullet(direction: float) -> void:
	var instance = projectile.instantiate()
	instance.set_shooter(arma.get_shooter())
	instance.global_position = bullet_point.global_position

	instance.rotation = direction

	get_tree().current_scene.call_deferred("add_child", instance)

func fire_bullet() -> void:
	can_shoot = false
	print("MCHGun: pew")
	mchgun.play()
	var direction: float = (forward.global_position - global_position).angle()
	var offset: float = randf_range(-(current_recoil/2), (current_recoil/2))
	
	var recoil_increment = aperture_angle * 0.1
	current_recoil = clampf(current_recoil + recoil_increment, 0, aperture_angle)
	
	_create_bullet(direction + offset)
	
	municao -= 1
	if arma.get_shooter() is Inimigo:
		if municao == 0:
			carregado = false
		if carregado:
			tempo_entre_tiros.start()
	else:
		if municao == 0:
			tempo_entre_tiros.stop()
			arma.change_arma("Faca")
		else:
			tempo_entre_tiros.start()

func _on_tempo_entre_tiros_timeout():
	mchgun.stop()
	can_shoot = true

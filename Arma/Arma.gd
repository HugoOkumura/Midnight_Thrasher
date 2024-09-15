extends Node2D
class_name Arma

@export_enum("Pistola", "Faca", "Shotgun", "MCHgun") var initial_arma:String
@onready var change_time = $"change time"

var armas_dic := {} 

var shooter 
var current_arma: Arma
var bullets_per_shot : int
var shoot_time : float
var aperture_angle :float
var shot_distance :float
var damage : int
var can_shoot : bool
var municao : int
var combo_time : float

func _ready():
	shooter = self.get_parent()
	for child in get_children():
		if child is Arma:
			armas_dic[child.name.to_lower()] = child
	if initial_arma:
		if get_shooter() is Jogador:
			Global.arma_principal = initial_arma
			Global.arma = Global.palavra_para_inteiro(initial_arma)
			Global.faca_equipada = false
		Global.municao = 0
		current_arma = armas_dic.get(initial_arma.to_lower())
		current_arma.set_arma_params()
		if shooter is Jogador:
			await get_tree().create_timer(0.01).timeout
			shooter.hud.municao.change_arma(initial_arma.to_lower())


func set_arma_params():
	pass

func fire():
	current_arma.fire_bullet()

func get_shoot_time() -> float:
	return current_arma.shoot_time

func get_shot_distance()->float:
	return current_arma.shot_distance
	
func get_shooter() -> Node2D:
	return shooter

func change_arma(new_arma_name:String):
	change_time.start()
	var new = armas_dic.get(new_arma_name.to_lower())
	if !new:
		return
	if shooter is Jogador:
		shooter.hud.municao.change_arma(new_arma_name.to_lower())
	await change_time.timeout
	current_arma = new
	current_arma.set_arma_params()
	Global.trocando_arma = false

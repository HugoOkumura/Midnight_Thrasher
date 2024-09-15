extends CharacterBody2D
class_name Jogador

const SPEED: float = 200
const TURN_SPEED: float = 5
const CROSSHAIR = preload("res://Player/character_crosshair.png")

@onready var _pl = $"."
@onready var _animated_sprite = $AnimatedSprite2D
@export var _keys: Dictionary = {
	"left":  "ui_left",
	"right": "ui_right",
	"up":    "ui_up", 
	"down":  "ui_down"}

@onready var arma_player = $Arma

var can_shoot := true
var _input: Vector2 = Vector2.ZERO
var _direction: Vector2 = Vector2.ZERO
var _screen_size: Vector2
var weapon_nearby
var arma1 = "Pistola"
var arma2 = "MCHGun"
var arma3 = "Shotgun" 
#var bullet = preload("res://Arma/Bullet.tscn")
#var recarregado = true
var hp = 2
var colete = false
var morto = false
var hud : HUD

signal hit

func _ready() -> void:
	hud = get_tree().get_first_node_in_group("HUD")
	await get_tree().create_timer(0.01).timeout
	hud.vida.update_health(hp)
	_screen_size = get_viewport_rect().size
	Input.set_custom_mouse_cursor(CROSSHAIR)
	z_index = 2

func _process(_delta: float) -> void:

	if Input.is_action_pressed("ui_left") || Input.is_action_pressed("ui_up") || Input.is_action_pressed("ui_right") || Input.is_action_pressed("ui_down"):
		if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
			if Global.faca_equipada:
				_animated_sprite.play("FACADA_RUN")
			else:
				if Global.arma == 0:
					_animated_sprite.play("SHOOT_RUN_"+"Pistola")
				elif Global.arma == 1:
					_animated_sprite.play("SHOOT_RUN_"+"MCHGun")
				elif Global.arma == 2:
					_animated_sprite.play("SHOOT_RUN_"+"Shotgun")
		else:
			_animated_sprite.play("RUN")
	else:
		if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
			if Global.faca_equipada:
				_animated_sprite.play("FACADA")
			else:
				if Global.arma == 0:
					print("Cheguei aqui")
					_animated_sprite.play("Pistola")
				elif Global.arma == 1:
					_animated_sprite.play("MCHGun")
					print("Cheguei aqui")
				elif Global.arma == 2:
					_animated_sprite.play("Shotgun")
					print("Cheguei aqui")
		else:
			_animated_sprite.play("STOPED")
	_move_in_any_direction(_delta)
	_aim_burster()
	#if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and Global.criacao_no_pai != null and recarregado:
		#Global._instance_node(bullet, global_position, Global.criacao_no_pai)
		#recarregado = false
		#$"tempo de recarga".start()
	
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and arma_player.current_arma.can_shoot:
		arma_player.fire()
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT) and arma_player.current_arma.can_shoot:
		if !Global.trocando_arma:	
			if !Global.faca_equipada:
				Global.trocando_arma = true
				Global.faca_equipada = true
				arma_player.change_arma("Faca")
			else:
				if Global.municao > 0:
					Global.trocando_arma = true
					Global.faca_equipada = false
					arma_player.change_arma(Global.arma_principal)
		#if weapon_nearby:
			#equip_weapon(weapon_nearby)
			#weapon_nearby = null
			#print("Weapon picked up!")
	if hp <= 0:
		morte.play()
		get_tree().change_scene_to_file("res://gameover/gameover.tscn")
	


func _move_in_any_direction(_delta: float) -> void:
	_input = Input.get_vector(_keys["left"], _keys["right"], _keys["up"], _keys["down"])

	_move_and_rotate(_delta)
	
	
func _move_and_rotate(delta: float) -> void:
	_direction = _direction.slerp(_input, 20.00 * delta)
	
	velocity = _input * SPEED
	move_and_slide()
	#_clamp_screen()


#func _clamp_screen() -> void:
	#position.x = clamp(position.x, 0, _screen_size.x)
	#position.y = clamp(position.y, 0, _screen_size.y)
#
func _wrap_screen() -> void:
	position.x = wrap(position.x, 0, _screen_size.x)
	position.y = wrap(position.y, 0, _screen_size.y)

func _aim_burster():
	_pl.look_at(get_global_mouse_position())

func got_hit(dmg:int):
	if colete:
		colete = false
		print("me sinto indefeso")
	else:
		hp -= dmg
		Global.hp = hp

#func _on_hitbox_area_entered(area):
	#if area.is_in_group("Dano2"): #######mudar para esse grupo
		#area.queue_free()
		#hp -= 1

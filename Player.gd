extends CharacterBody2D
class_name Player

const SPEED: float = 200
const TURN_SPEED: float = 5
const CROSSHAIR = preload("res://PLAYER/character_crosshair.png")

@onready var _pl = $"."
@onready var _animated_sprite = $AnimatedSprite2D
@onready var _size: Vector2 = $AnimatedSprite2D.get_viewport_rect().size
@export var _keys: Dictionary = {
	"left":  "ui_left",
	"right": "ui_right",
	"up":    "ui_up", 
	"down":  "ui_down"}

var can_shoot := true
var _input: Vector2 = Vector2.ZERO
var _direction: Vector2 = Vector2.ZERO
var _screen_size: Vector2

func _ready() -> void:
	_screen_size = get_viewport_rect().size
	Input.set_custom_mouse_cursor(CROSSHAIR)


func _process(_delta: float) -> void:

	if Input.is_action_pressed("ui_left") || Input.is_action_pressed("ui_up") || Input.is_action_pressed("ui_right") || Input.is_action_pressed("ui_down"):
		if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
			#_animated_sprite.play("PUNCH_RUN")
			_animated_sprite.play("SHOOT_RUN")
		else:
			_animated_sprite.play("RUN")

	else:
		if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
			#_animated_sprite.play("PUNCH")
			_animated_sprite.play("SHOOT")
		else:
			_animated_sprite.play("STOPED")
			
	_move_in_any_direction(_delta)
	_aim_burster()


func _move_in_any_direction(_delta: float) -> void:
	_input = Input.get_vector(_keys["left"], _keys["right"], _keys["up"], _keys["down"])

	_move_and_rotate(_delta)
	
	
func _move_and_rotate(delta: float) -> void:
	_direction = _direction.slerp(_input, 20.00 * delta)
	
	velocity = _input * SPEED
	move_and_slide()
	_wrap_screen()	


func _clamp_screen() -> void:
	position.x = clamp(position.x, _size.x/2, _screen_size.x - _size.x/2)
	position.y = clamp(position.y, _size.y/2, _screen_size.y - _size.y/2)

func _wrap_screen() -> void:
	position.x = wrap(position.x, 0, _screen_size.x)
	position.y = wrap(position.y, 0, _screen_size.y)

func _aim_burster():
	_pl.look_at(get_global_mouse_position())

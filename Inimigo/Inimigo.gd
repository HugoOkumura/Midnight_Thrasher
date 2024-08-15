extends CharacterBody2D
class_name Inimigo

@onready var ani_sprite : AnimatedSprite2D = $AnimatedSprite2D
@onready var nav2d = $NavigationAgent2D

@export var rotation_speed = 2
@export var walk_speed = 150
@export var nav_target : CharacterBody2D

var current_speed

func _ready():
	var navigation_map = get_tree().get_first_node_in_group("tilemap").get_navigation_map(0)
	NavigationServer2D.agent_set_map(nav2d.get_rid(), navigation_map)
	nav2d.set_navigation_map(navigation_map)
	current_speed = walk_speed
	

func _physics_process(delta):
	
	if velocity.length() != 0:
		ani_sprite.play("andar")
	else:
		ani_sprite.play("parado")
		
func move_to_position(target_position: Vector2):
	var motion = position.direction_to(target_position) * current_speed
	nav2d.set_velocity_forced(motion)
	look_at(target_position)
	velocity = motion
	move_and_slide()

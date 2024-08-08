extends CharacterBody2D

class_name Inimigo

@onready var navigation_agent_2d = $NavigationAgent2D
@export var navigation_target = CharacterBody2D

const SPEED = 150


func _physics_process(delta: float) -> void:
	navigation_agent_2d.target_position = navigation_target
	velocity = global_position.direction_to(navigation_agent_2d.get_next_path_position()) * SPEED
	move_and_slide()
	

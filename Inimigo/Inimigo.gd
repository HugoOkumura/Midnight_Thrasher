extends CharacterBody2D
class_name Inimigo

#@onready var ani_sprite : AnimatedSprite2D = $AnimatedSprite2D
@onready var nav2d = $NavigationAgent2D
@onready var statesm = $"State Machine" as StateMachine

@export var path2d : Path2D
@export var rotation_speed = 2
@export var walk_speed = 150
@export var nav_target : Jogador = null
@onready var morte = $morte


var distance: float
var current_speed
var death_ani = ["morte_1", "morte_2", "morte_3"]
var hp = 2

func _ready():
	var navigation_map = get_tree().get_first_node_in_group("tilemap").get_navigation_map(0)
	NavigationServer2D.agent_set_map(nav2d.get_rid(), navigation_map)
	nav2d.set_navigation_map(navigation_map)
	current_speed = walk_speed
	z_index = 2

func move_to_position(target_position: Vector2):
	var direction = (target_position - global_position).normalized()
	var motion = direction * current_speed
	nav2d.set_velocity_forced(motion)
	look_at(target_position)
	velocity = motion
	move_and_slide()
	distance = self.global_position.distance_to(nav_target.global_position)
	
	
func move_along_path(path: PathFollow2D, delta: float):
	path.progress += walk_speed * delta

func _on_vision_cone_area_body_entered(body):
	if body.is_in_group("Jogador"):
		set_target(body)
		
func got_hit(dmg: int):
	hp -= dmg
	print(hp)
	if hp == 0:
		statesm.current_state.Transitioned.emit(statesm.current_state, "InimigoMorte", null)
		morte.play()
	

func is_target_null() -> bool: 
	return nav_target == null
	
func set_target(target: CharacterBody2D):
	nav_target = target

func get_target() -> CharacterBody2D:
	return nav_target

func get_distance() -> float:
	return distance

func set_distance(inimigo_pos: Vector2, jogador_pos: Vector2):
	distance = inimigo_pos.distance_to(jogador_pos)
	


func _on_hitbox_area_entered(area):
	if area.is_in_group("Dano"):
		area.queue_free()
		hp -= 1

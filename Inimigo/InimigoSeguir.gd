extends State
class_name InimigoSeguir

@export var inimigo : CharacterBody2D
@export var alvo : CharacterBody2D
@export var speed := 150.0
@onready var nav: NavigationAgent2D = $"../../NavigationAgent2D"

func Enter(args):
	alvo = args
	print(alvo)
	
func Physics_Update(delta: float):
	var player_position = alvo.global_position
	var nav_point = NavigationServer2D.map_get_closest_point(nav.get_navigation_map(), player_position)
	nav.target_position = nav_point
	var next_position = nav.get_next_path_position()
	(owner as Inimigo).move_to_position(next_position)
	

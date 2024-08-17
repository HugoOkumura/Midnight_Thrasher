extends State
class_name InimigoSeguir

@onready var inimigo = $"../.." as Inimigo
@onready var nav: NavigationAgent2D = $"../../NavigationAgent2D"
@onready var ani_sprite = $"../../AnimatedSprite2D"
@onready var arma_inimigo = $"../../Arma Inimigo"

var player_position : Vector2
var nav_point 

func Enter(_args):
	ani_sprite.play("seguir_armado")

func Physics_Update(_delta: float):
	player_position = inimigo.get_target().global_position
	nav_point = NavigationServer2D.map_get_closest_point(nav.get_navigation_map(), player_position)
	nav.target_position = nav_point
	var next_position = nav.get_next_path_position()
	inimigo.move_to_position(next_position)
	
	if inimigo.get_distance() <= arma_inimigo.shot_distance:
		Transitioned.emit(self, "InimigoAtaque", null)
	

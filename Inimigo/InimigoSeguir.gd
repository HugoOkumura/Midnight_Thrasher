extends State
class_name InimigoSeguir

@onready var inimigo = $"../.." as Inimigo
@onready var nav: NavigationAgent2D = $"../../NavigationAgent2D"
@onready var ani_sprite = $"../../AnimatedSprite2D"
@onready var arma_inimigo = $"../../Arma"

var player_position : Vector2
var nav_point 

func Enter(_args):
	var animation = arma_inimigo.current_arma.name
	animation = animation.left(1)
	if animation != "F":
		animation = "seguir_armado_" + animation
	else:
		animation = "patrulhar"
	#print(animation)
	ani_sprite.play(animation)

func Physics_Update(_delta: float):
	player_position = inimigo.get_target().global_position
	nav_point = NavigationServer2D.map_get_closest_point(nav.get_navigation_map(), player_position)
	nav.target_position = nav_point
	var next_position = nav.get_next_path_position()
	inimigo.move_to_position(next_position)
	
	if inimigo.get_distance() <= arma_inimigo.get_shot_distance():
		Transitioned.emit(self, "InimigoAtaque", null)
	

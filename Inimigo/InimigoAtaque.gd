extends State
class_name InimigoAtaque

@onready var inimigo = $"../.." as Inimigo
@onready var ani_sprite = $"../../AnimatedSprite2D"
@onready var nav = $"../../NavigationAgent2D"
@onready var arma_inimigo = $"../../Arma"
@onready var timer = $Timer

#var atk_time = arma_inimigo.get_shoot_time()
var player_position
var nav_point


func Enter(_args):
	var animation = arma_inimigo.current_arma.name
	animation = animation.left(1)
	animation = "parado_armado_" + animation
	#print(animation)
	ani_sprite.play(animation)
	if arma_inimigo.current_arma.can_shoot:
		shoot()
	
func Physics_Update(_delta: float):
	player_position = inimigo.get_target().global_position
	nav_point = NavigationServer2D.map_get_closest_point(nav.get_navigation_map(), player_position)
	nav.target_position = nav_point
	inimigo.look_at(nav.target_position)
	
	if arma_inimigo.current_arma.can_shoot:
		shoot()
	
	if inimigo.get_distance() > arma_inimigo.get_shot_distance():
		Transitioned.emit(self, "InimigoSeguir", null)
	
	inimigo.set_distance(inimigo.global_position, player_position)

func shoot():
	arma_inimigo.fire()


#func _on_timer_timeout():
	#if inimigo.statesm.current_state is InimigoAtaque:
		#shoot()

extends State
class_name InimigoAtaque

@onready var inimigo = $"../.." as Inimigo
@onready var ani_sprite = $"../../AnimatedSprite2D"
@onready var nav = $"../../NavigationAgent2D"
@onready var arma_inimigo = $"../../Arma Inimigo"
@onready var timer = $Timer

#var atk_time = arma_inimigo.get_shoot_time()
var player_position
var nav_point
var time_elapsed := 0.0

func Enter(_args):
	ani_sprite.play("parado_armado")
	#shoot()
	
func Physics_Update(_delta: float):
	player_position = inimigo.get_target().global_position
	nav_point = NavigationServer2D.map_get_closest_point(nav.get_navigation_map(), player_position)
	nav.target_position = nav_point
	inimigo.look_at(nav.target_position)
	
	if time_elapsed >= arma_inimigo.shoot_time:
		shoot()
	
	if inimigo.get_distance() > arma_inimigo.shot_distance:
		Transitioned.emit(self, "InimigoSeguir", null)
	
	inimigo.set_distance(inimigo.global_position, player_position)

func shoot():
	arma_inimigo.fire_bullet(inimigo)
	timer.start()

#func Exit():
	#time_elapsed = 0

func _on_timer_timeout():
	if inimigo.statesm.current_state is InimigoAtaque:
		shoot()

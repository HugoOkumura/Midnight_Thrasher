extends State
class_name InimigoPatrulha

@onready var caminho : PathFollow2D = $"../../../../PathFollow2D"
@onready var inimigo = $"../.." as Inimigo
@onready var ani_sprite = $"../../AnimatedSprite2D"
@onready var alert_area = $"../../Alert Area"

func Enter(args):
	caminho.progress = 0.0
	caminho.loop = true
	caminho.cubic_interp = true
	caminho.rotates = true
	ani_sprite.play("patrulhar")
	#pass

func Physics_Update(_delta: float):
	inimigo.move_along_path(caminho, _delta)
	
	if not inimigo.is_target_null():
		Transitioned.emit(self, "InimigoSeguir", null)

func Exit():
	alert_in_range()
	
func _on_inimigo_classe_raycast_found(body):
	if body.is_in_group("Jogador"):
		inimigo.set_target(body)

func alert_in_range():
	for body in alert_area.get_overlapping_bodies():
		if body.is_in_group("Inimigo"):
			body.set_target(inimigo.get_target())

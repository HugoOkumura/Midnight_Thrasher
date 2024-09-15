extends Node


var criacao_no_pai = null
var enemy :int
var kill_combo = 1
var phase_clear := false
var colete = false

var arma_principal
var faca_equipada = false
#var sem_municao = false 
var trocando_arma = false
var municao = 0
var hp = 2
var arma: int





var score_total :int = 0
var score_phase : int = 0
var phase_score_multiplier : float = 1.0
var time = 0


func _process(delta):
	time += delta
	if time >= 30:
		phase_score_multiplier -= 0.05

func _instance_node(node, location, parent):
	var node_instance = node.instantiate()
	parent.add_child(node_instance)
	node_instance.global_position = location
	return node_instance

func update_total_score(player):
	score_total += round(score_phase * phase_score_multiplier)
	score_phase = 0
	phase_score_multiplier = 1.0
	time = 0
	player.hud.score.change_score(score_total)
	

func update_phase_score(score:int, combo: int):
	score_phase += score*combo

func reduce_enemy_count():
	enemy -= 1
	add_to_score()
	if enemy == 0:
		
		var proximafase = get_tree().get_first_node_in_group('proximafase')
		var seta = proximafase.get_child(1)
		seta.visible = true
		phase_clear = true

func add_to_score():
	var player = get_tree().get_first_node_in_group("Jogador")
	var player_arma = player.arma_player.current_arma
	var combo_time = player_arma.combo_time
	if GlobalT.is_stopped():
		GlobalT.start(combo_time)
		kill_combo = 1
	else:
		kill_combo +=1
	
	update_phase_score(500, kill_combo)


func postion_player_to_new_scene(player:Jogador, scene):
	for start in scene.get_children():
		if start is Marker2D:
			player.global_position = start.global_position
			player.change_HUD()


func palavra_para_inteiro(palavra: String) -> int:
	var mapeamento = {
		"Pistola": 0,
		"MCHGun": 1,
		"MCHgun": 1,
		"Shotgun": 2
	}
	return mapeamento.get(palavra, -1)

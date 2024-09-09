extends Node

var criacao_no_pai = null
var enemy = 3
var kill_combo = 1

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


func update_total_score(score: int):
	score_total += round(score_phase * phase_score_multiplier)
	score_phase = 0
	phase_score_multiplier = 1.0
	time = 0

func update_phase_score(score:int, combo: int):
	score_phase += score*combo
	
func reduce_enemy_count():
	enemy -= 1
	add_to_score()

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
	player.hud.score.change_score(score_phase)


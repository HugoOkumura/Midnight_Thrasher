extends Node

@onready var player:Jogador = $Player

func _ready():
	Global.criacao_no_pai = self
	Global.enemy = 1
	Global.kill_combo = 1
	Global.time = 0
	GlobalT.stop()
	Global.phase_clear = false
	set_player()

func _exit_tree():
	Global.criacao_no_pai = null

func set_player():
	if SceneManager.player:
		if player:
			player.queue_free()
		
		player = SceneManager.player
		add_child(player)
		Global.postion_player_to_new_scene(get_tree().get_first_node_in_group("Jogador"), self)

extends Node

@onready var player:Jogador = $Player

func _ready():
	Global.criacao_no_pai = self
	Global.enemy = 4
	Global.kill_combo = 1
	Global.time = 02
	GlobalT.stop()
	Global.score_phase = 0
	Global.score_total = 0
	Global.phase_clear = false

func _exit_tree():
	Global.criacao_no_pai = null

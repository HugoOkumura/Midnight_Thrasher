extends Node

func _ready():
	Global.enemy = 1
	Global.criacao_no_pai = self
	Global.kill_combo = 1
	

func _exit_tree():
	Global.criacao_no_pai = null

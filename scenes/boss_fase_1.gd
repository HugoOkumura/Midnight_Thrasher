extends Node2D

@onready var camera = $Player/Camera

func _ready():
	Global.criacao_no_pai = self
	Global.enemy = 1
	Global.kill_combo = 1
	Global.time = 0
	GlobalT.stop()
	Global.phase_clear = false

func _exit_tree():
	Global.criacao_no_pai = null

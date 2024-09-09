extends Node

func _ready():
	Global.criacao_no_pai = self
	Global.enemy = 3

func _exit_tree():
	Global.criacao_no_pai = null


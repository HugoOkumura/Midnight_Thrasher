extends Node

func _ready():
	Global.criacao_no_pai = self

func _exit_tree():
	Global.criacao_no_pai = null

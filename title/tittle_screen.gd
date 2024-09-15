extends Control

@onready var score = $score


# Called when the node enters the scene tree for the first time.

func _ready():
	score.text = "PONTOS:%d " % Global.score_total

func _on_exit_pressed():
	get_tree().quit()

func _on_start_pressed():
	get_tree().change_scene_to_file("res://scenes/andar_1.tscn")

func _on_restart_button():
	get_tree().change_scene_to_file("res://scenes/andar_1.tscn")

func _on_home_button():
	get_tree().change_scene_to_file("res://title/tittle_screen.tscn")

func _on_exit_button():
		get_tree().quit()

extends Control


# Called when the node enters the scene tree for the first time.

func _on_start_pressed():
	get_tree().change_scene_to_file("res://scenes/world.tscn")


func _on_exit_pressed():
	get_tree().quit()

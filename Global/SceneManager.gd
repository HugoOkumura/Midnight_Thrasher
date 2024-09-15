extends Node
class_name SCNMANAGER

var player : Jogador
var pasta_das_cenas = "res://scenes/"

func change_scene(from, to:String):
	player = from.player
	player.get_parent().remove_child(player)
	
	var full_path = pasta_das_cenas + to + ".tscn"
	Global.update_total_score(player)
	from.get_tree().call_deferred("change_scene_to_file", full_path)

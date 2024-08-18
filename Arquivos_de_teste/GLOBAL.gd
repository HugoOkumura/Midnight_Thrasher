extends Node

var criacao_no_pai = null

func _instance_node(node, location, parent):
	var node_instance = node.instantiate()
	parent.add_child(node_instance)
	node_instance.global_position = location
	return node_instance


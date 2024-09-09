extends Node

var criacao_no_pai = null
var enemy = 3
var arma_principal = "Pistola"
var faca_equipada = false
var sem_municao = false 
var trocando_arma = false

func _instance_node(node, location, parent):
	var node_instance = node.instantiate()
	parent.add_child(node_instance)
	node_instance.global_position = location
	return node_instance

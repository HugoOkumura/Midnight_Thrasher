extends Node

var criacao_no_pai = null
var enemy = 3
var arma_principal
var faca_equipada = false
#var sem_municao = false 
var trocando_arma = false
var municao = 0
var hp = 2
var arma: int

func _instance_node(node, location, parent):
	var node_instance = node.instantiate()
	parent.add_child(node_instance)
	node_instance.global_position = location
	return node_instance
	
func palavra_para_inteiro(palavra: String) -> int:
	var mapeamento = {
		"Pistola": 0,
		"MCHGun": 1,
		"MCHgun": 1,
		"Shotgun": 2
	}
	return mapeamento.get(palavra, -1)

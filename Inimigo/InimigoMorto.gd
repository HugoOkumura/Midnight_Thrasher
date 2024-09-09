extends Node2D

@onready var sprites = $sprites
var sprite_name : String
var arma_name
#var teste
#@onready var arma_inimigo = $"../../Arma"
@onready var drop = $drop

func _ready():
	z_index = 1
	sprites.play(sprite_name)
	print(sprites)
	#print("teste " + arma_inimigo.current_arma.name)
	if arma_name == "Faca":
		drop.equip_item("Colete")
	else:
		drop.equip_item(arma_name)

func arma_do_inimigo(arma: String):
	print("teste " + arma)
	arma_name = arma
	
#func play_sprite(sprite_name: String):
	#z_index = 1
	#sprites.play(sprite_name)

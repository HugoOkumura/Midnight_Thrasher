extends Node2D

var arma: String
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var drop = $"."

func _ready():
	z_index = 0
	animated_sprite_2d.visible = true

func equip_item(item_name: String):
	arma = item_name
	animated_sprite_2d.play(item_name)


#func _on_area_2d_area_entered(body):
	#if body is Jogador:
		#print("entrei")
		#body.arma_player = arma
		#Global.arma_principal = arma
		#queue_free()



func _on_area_2d_body_entered(body):
	if body is Jogador:
			if arma == "Colete":
				if !body.colete:
					print("meu "+ arma + "me protege")
					body.colete = true
					queue_free()
				
			elif Global.municao == 0:
				print("vi a arma "+ arma)
				Global.arma_principal = arma
				Global.municao = 0
				Global.trocando_arma = true
				Global.faca_equipada = false
				Global.arma = Global.palavra_para_inteiro(arma)
				body.arma_player.change_arma(Global.arma_principal)
				queue_free()


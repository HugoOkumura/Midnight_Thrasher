extends NinePatchRect
class_name Municao

@onready var label = $Label

var mhcgun = preload("res://sprites/armas/Sprite-MachineGun.png")
var pistola = preload("res://sprites/armas/Sprite_Pistola.png")
var shotgun = preload("res://sprites/armas/Sprite-ShotGun.png")
var faca = preload("res://sprites/armas/Faca.png")

var ammo

func change_arma(new_arma : String):
	var current_arma = get_child(0)
	if new_arma == "mchgun":
		current_arma.texture = mhcgun
		ammo = 12
	elif new_arma == "pistola":
		current_arma.texture = pistola
		ammo = 7
	elif new_arma == "shotgun":
		current_arma.texture = shotgun
		ammo = 2
	else:
		current_arma.texture = faca
		ammo = 0
	
	if ammo > 0:
		label.text = "%d" % ammo
	else:
		label.text = "--"

func change_ammo(ammo_left: int):
	ammo = ammo_left
	label.text = "%d" % ammo

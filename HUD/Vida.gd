extends NinePatchRect
class_name Vida

enum Modos {Cheia, Meia, Protegida}

var vida_cheia = preload("res://sprites/Outros/Full_heart.png")
var vida_meia = preload("res://sprites/Outros/Half_heart.png")
var vida_prote = preload("res://sprites/Outros/Protected_heart.png")

# Esta função é chamada quando:
# 1. Quando o Player recebe dano
# 2. Quando o Player pega o colete
# 3. Quando há transição de faze para voltar a vida como cheia
# 	-> Se tiver com colete a vida permanece com colete mas agr com vida cheia
# Resumindo, a função é chamada depois do cálculo da vida atual após ações específicas relacionadas
# à vida do player

func update_health(value):
	var vida = get_child(0)
	if value == 2:
		vida.texture = vida_cheia
	elif value == 1:
		vida.texture = vida_meia
	elif value > 2:
		vida.texture = vida_prote


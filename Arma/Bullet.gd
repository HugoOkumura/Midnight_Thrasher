#extends Area2D
#class_name Bullet
#
#@export var speed = 200
#
#var shooter : CharacterBody2D
#
#var bullet = preload("res://Arquivos_de_teste/bullet.tscn")
#
#
#func _on_body_entered(body:CharacterBody2D):
	#if body.is_in_group("Jogador") and shooter.is_in_group("Inimigo"):
		#queue_free()
	#if body.is_in_group("Inmigo") and shooter.is_in_group("Jogador"):
		#body.got_hit()

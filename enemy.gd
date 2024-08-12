extends CharacterBody2D

class_name Inimigo

signal player_detected(player)

var target : CharacterBody2D = null
var is_chasing = false

const SPEED = 150

func _on_Area2D_body_entererd(body):
	if body.is_in_group("Player"):
		emit_signal("player_detected", body)
		alert_other_enemies(body)
		start_chasing(body)
		
func alert_other_enemies(player: CharacterBody2D):
	for enemy in get_tree().get_nodes_in_group("Inimigo"):
		if enemy != self:
			enemy.start_chasing(player)
			
func start_chasing(player):
	target = player
	is_chasing = true
	
func _process(delta):
	if is_chasing and target:
		$NavigationAgent2D.target_position = target.global_position
		velocity = global_position.direction_to($NavigationAgent2D.get_next_path_position()) * SPEED
		move_and_slide()

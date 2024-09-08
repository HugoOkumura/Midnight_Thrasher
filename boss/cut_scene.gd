extends Node2D

@onready var animation_player = $AnimationPlayer
@export var boss_texture: Texture2D
@export var name_texture: Texture2D
@export var SceneNext: PackedScene

@onready var bossSprite = $Character/Boss
@onready var nameSprite = $Character/name
@onready var audio_stream_player_2d = $AudioStreamPlayer2D


# Called when the node enters the scene tree for the first time.
func _ready():
	if bossSprite and boss_texture:
		bossSprite.texture = boss_texture
	if nameSprite and name_texture:
		nameSprite.texture = name_texture
	
	audio_stream_player_2d.play(0.0)
	animation_player.play("cut_boss")


func _on_timer_timeout():
	audio_stream_player_2d.stop()
	get_tree().change_scene_to_packed(SceneNext)

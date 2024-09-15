extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func normal():
	$boss.stop()
	$normal.play()
	
func boss():
	$normal.stop()
	$boss.play()
	
func sem_musica():
	$normal.stop()
	$boss.stop()

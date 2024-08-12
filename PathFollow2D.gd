extends PathFollow2D

var speed = 0.30

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	progress_ratio += speed * delta*0.5

extends StateBoss
class_name PunchState

@onready var timer_2 = $"../../Timer2"

# Called when the node enters the scene tree for the first time
var transition_wait = false


func transition():
	if transition_wait:
		get_parent().change_state('Idle')
		
func enter():
	super.enter()
	print("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA")

func exit():
	super.exit()
	


	

extends Node2D
class_name StateMachine

@export var initial_state: State
var current_state: State 
var states : Dictionary = {}

func _ready():
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
			child.Transitioned.connect(on_child_transition)
		
	if initial_state:
		initial_state.Enter(0)
		current_state = initial_state
		

func _process(_delta):
	if current_state:
		current_state.Update(_delta)
	
func _physics_process(_delta):
	if current_state:
		current_state.Physics_Update(_delta)

func on_child_transition(state, new_state_name, _args):
	if state != current_state:
		return
	
	var new_state = states.get(new_state_name.to_lower())
	if !new_state:
		return
	
	if current_state:
		current_state.Exit()
	
	new_state.Enter(_args)
	
	current_state = new_state



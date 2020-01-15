extends Node

var current_state = "None" setget set_current_state, get_current_state
onready var state_animator = $State

func _ready():
	set_current_state("Menu")

func _on_State_animation_changed(old_name, new_name):
	print("_on_State_animation_changed " + new_name)
	set_current_state(new_name)

func set_current_state(new_value):
	print("set_current_state " + new_value)
	state_animator.play(new_value)
	current_state = new_value
	
func get_current_state():
	return current_state
	
func toggle_pause():
	# avoid pause in menu, we could exit the game
	if current_state == "Menu":
		return
	
	# unpause
	if current_state == "Pause":
		print("unpause")
		set_current_state("InGame")
		return
		
	# pause
	if current_state == "InGame":
		print("pause")
		set_current_state("Pause")
		return
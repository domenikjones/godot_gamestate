extends Node

var current_state = "None" setget set_current_state, get_current_state
onready var state_animator = $State

func _ready():
	set_current_state("Menu")

func set_current_state(new_state):
	state_animator.play(new_state)
	current_state = new_state
	handle_scene_change(new_state)
	
func get_current_state():
	return current_state
	
func handle_scene_change(new_state):
	var current_scene = get_tree().get_current_scene().get_name()
	print("current_scene", current_scene)
	
	if new_state == "InGame" and current_scene != "Game":
		get_tree().change_scene("res://Scenes/Game.tscn")
		return
		
	if new_state == "Menu" and current_scene != "Menu":
		get_tree().change_scene("res://Scenes/GameMenu.tscn")
		return
	
func toggle_pause():
	# avoid pause in menu, we could exit the game
	if current_state == "Menu":
		#get_tree().quit()
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
	
func _on_State_animation_changed(old_name, new_name):
	set_current_state(new_name)

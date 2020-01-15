extends Node

onready var game_state_label = $Control/GameStateLabel

func _process(delta):
	display_current_game_state()
	handle_input()
	
func handle_input():
	if Input.is_action_just_pressed("ui_cancel"):
		GameState.toggle_pause()

func display_current_game_state():
	game_state_label.text = "CurrentState: " + GameState.get_current_state()
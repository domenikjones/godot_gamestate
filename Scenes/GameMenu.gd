extends Control

onready var game_state_label = $GameStateLabel

func _process(delta):
	set_current_state_label()
	handle_input()

func set_current_state_label():
	game_state_label.text = "CurrentState: " + GameState.get_current_state()

func handle_input():
	if Input.is_action_just_pressed("ui_cancel"):
		GameState.toggle_pause()
		return

func _on_StartButton_pressed():
	GameState.set_current_state("InGame")

func _on_QuitButton_pressed():
	GameState.toggle_pause()

extends Node

onready var game_state_label = $GameStateLabel
onready var pause_menu = $PauseMenu

func _ready():
	pause_menu.visible = false


func _process(delta):
	display_current_game_state()
	handle_input()
	show_pause_menu()


func show_pause_menu():
	if GameState.get_current_state() == "Pause":
		pause_menu.visible = true
	else:
		pause_menu.visible = false


func handle_input():
	if Input.is_action_just_pressed("ui_cancel"):
		GameState.toggle_pause()


func display_current_game_state():
	game_state_label.text = "CurrentState: " + GameState.get_current_state()


func _on_ContinueButton_pressed():
	GameState.toggle_pause()


func _on_MenuButton_pressed():
	GameState.set_current_state("Menu")


func _on_QuitButton_pressed():
	get_tree().quit()

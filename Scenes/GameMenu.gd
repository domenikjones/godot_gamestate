extends Control

onready var game_state_label = $GameStateLabel

func _process(delta):
	game_state_label.text = "CurrentState: " + GameState.get_current_state()

func _on_StartButton_pressed():
	GameState.set_current_state("InGame")
	get_tree().change_scene("res://Scenes/Game.tscn")

func _on_QuitButton_pressed():
	get_tree().quit()

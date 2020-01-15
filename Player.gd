extends KinematicBody2D

onready var player_animator = $Animator
export (int) var speed = 200
var velocity = Vector2()

func _ready():
	player_animator.play("Walk")


func _process(delta):
	var move = handle_input()

func _physics_process(delta):
    handle_input()
    velocity = move_and_slide(velocity)

func handle_input():
	var current_state = GameState.get_current_state()
	if current_state != "InGame":
		return
	
	velocity = Vector2()
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed('ui_left'):
		velocity.x -= 1
	if Input.is_action_pressed('ui_down'):
		velocity.y += 1
	if Input.is_action_pressed('ui_up'):
		velocity.y -= 1
	
	velocity = velocity.normalized() * speed
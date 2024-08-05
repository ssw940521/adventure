extends BattleUnit

@export var speed := 40
#@onready var animation_player: AnimationPlayer = $AnimationPlayer
var animation_play : String = "idle_right"

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed

func _physics_process(delta):
	get_input()

	

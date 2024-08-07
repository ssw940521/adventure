extends BaseState

@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"
@onready var player: BattleUnit = $"../.."

func process_state() -> void:
	animate_idle()
	if player.velocity != Vector2.ZERO:
		get_parent().changeState(1)
	if Input.is_action_just_pressed("attack"):
		get_viewport().set_input_as_handled()
		get_parent().changeState(2)


func animate_idle() -> void:
	match get_parent().data[BaseState.DIRECTION]:
		"right":
			animation_player.play("idle_right")
		"left":
			animation_player.play("idle_left")

	

extends BaseState

@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"


func process_state()-> void:
	pass
	
func enter() -> void:
	if get_parent().data[BaseState.DIRECTION] == "left":
		animation_player.play("attack_left")
		await animation_player.animation_finished
		get_parent().changeState(1)
	elif get_parent().data[BaseState.DIRECTION] == "right":
		animation_player.play("attack_right")
		await animation_player.animation_finished
		get_parent().changeState(1)
		
func exit() -> void:
	pass

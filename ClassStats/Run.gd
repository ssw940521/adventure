extends BaseState
@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"
@onready var player: BattleUnit = $"../.."

func process_state() -> void:
	animate_walk()
	if player.velocity == Vector2.ZERO:
		get_parent().changeState(0)
	player.move_and_slide()

func enter() -> void:
	print("Run!")
	
	
func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	player.velocity = input_direction * player.speed
	
func animate_walk()->void:
	var angle : float = player.velocity.angle()
	var angel_in_degree : float = rad_to_deg(angle)
	var rounded_angle : int = int(round(angel_in_degree / 45) * 45 )
	if player.velocity != Vector2.ZERO:
		match rounded_angle:
			-135,180,135: 
				animation_player.play("walk_left")
				get_parent().data[BaseState.DIRECTION] = "left"
			0,-45,45:
				animation_player.play("walk_right")
				get_parent().data[BaseState.DIRECTION] = "right"
			-90,90:
				if get_parent().data[BaseState.DIRECTION] == "right":
					animation_player.play("walk_right")
				elif get_parent().data[BaseState.DIRECTION] == "left":
					animation_player.play("walk_left")

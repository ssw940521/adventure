extends BattleUnit

@onready var animation_player: AnimationPlayer = $AnimationPlayer
var animation_play : String = "idle_right"

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed

func _physics_process(delta):
	pass
	get_input()
	#move_and_slide()
	#if is_moving():
		#animate_walk()
	#else:
		#animate_idle()
	
func animate_walk() -> void:
	var angle : float = velocity.angle()
	var angel_in_degree : float = rad_to_deg(angle)
	var rounded_angle : int = int(round(angel_in_degree / 45) * 45 )
	match rounded_angle:
		-135,180,135: 
			animation_player.play("walk_left")
			animation_play = "walk_left"
		0,-45,45:
			animation_player.play("walk_right")
			animation_play = "walk_right"
		-90,90:
			if animation_play == "idle_right":
				animation_player.play("walk_right")
				animation_play = "walk_right"
			elif animation_play == "idle_left":
				animation_player.play("walk_left")
				animation_play = "walk_left"

func is_moving() -> bool:
	return velocity != Vector2.ZERO

func animate_idle() -> void:
	match animation_play:
		"walk_right":
			animation_player.play("idle_right")
			animation_play = "idle_right"
		"walk_left":
			animation_player.play("idle_left")
			animation_play = "idle_left"

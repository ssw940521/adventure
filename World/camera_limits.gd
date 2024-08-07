extends ColorRect


func _ready():
	var camera_limits := Rect2(global_position ,size)
	Events.emit_signal("request_update_camera_limits",camera_limits)
	hide()

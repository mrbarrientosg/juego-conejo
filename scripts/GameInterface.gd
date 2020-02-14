extends Control

onready var scene_tree: SceneTree = get_tree()
onready var pause_overlay: ColorRect = $PauseOverlay

var paused: bool = false setget set_paused
var minimum_drag: float = 100.0
var swipe_start: Vector2

func _input(event: InputEvent) -> void:
	if event is InputEventScreenDrag:
		print("0")

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		swipe_start = get_global_mouse_position()
		scene_tree.set_input_as_handled()
		print(swipe_start)
	if event.is_action_released("pause"):
		_calculate_swipe(get_global_mouse_position())


func _calculate_swipe(swipe_end: Vector2) -> void:
	if swipe_start == null: 
		return
	var swipe = swipe_end - swipe_start
	print(swipe)
	if abs(swipe.y) > minimum_drag:
		if swipe.y > 0:
			print("1")
		else:
			print("2")

func set_paused(value: bool) -> void:
	paused = value
	scene_tree.paused = value
	pause_overlay.visible = value

extends Actor

export var stomp_impulse: float = 1000.0

func _ready() -> void:
	$skin.play("run")
	set_process_unhandled_input(true)

func _on_EnemyDetector_area_entered(area: Area2D) -> void:
	_velocity = _calculate_stomp_velocity(_velocity, stomp_impulse)

func _on_EnemyDetector_body_entered(body: Node) -> void:
	queue_free()

func _unhandled_input(event: InputEvent) -> void:
	if not event is InputEventMouseButton or !event.is_pressed() or event.is_echo():
		return
		
	if event.button_index == BUTTON_LEFT:
		var direction: = _get_direction(true)
		_velocity = _calculate_move_velocity(_velocity, direction, speed)
		_velocity = move_and_slide(_velocity, FLOOR_NORMAL)

func _physics_process(delta: float) -> void:
	var direction: = _get_direction()
	_velocity = _calculate_move_velocity(_velocity, direction, speed)
	_velocity = move_and_slide(_velocity, FLOOR_NORMAL)

func _get_direction(jump: bool = false) -> Vector2:
	return Vector2(
		1.0, 
		-1.0 if jump and is_on_floor() else 1.0
	)

func _calculate_move_velocity(
		linear_velocity: Vector2,
		direction: Vector2,
		speed: Vector2
	) -> Vector2:
	var new_velocity: = linear_velocity
	new_velocity.x = speed.x * direction.x
	new_velocity.y += gravity * get_physics_process_delta_time()
	
	if direction.y == -1.0:
		new_velocity.y = speed.y * direction.y
		
	return new_velocity

func _calculate_stomp_velocity(linear_velocity: Vector2, impulse: float) -> Vector2:
	var new_velocity: = linear_velocity
	new_velocity.y = -impulse
	return new_velocity

func _on_skin_animation_finished() -> void:
	if $skin.animation == "kill":
		$skin.play("run")

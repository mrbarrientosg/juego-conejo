extends Actor

export var score: int = 100

func _ready() -> void:
	set_physics_process(false)
	_velocity.x = -speed.x

func _on_StompDetector_body_entered(body: Node) -> void:
	if body.global_position.y > $StompDetector.global_position.y:
		return
	_die()

func _on_Player_body_entered(body: Node) -> void:
	body.get_node("skin").play("kill")

func _on_VisibilityEnabler2D_screen_exited() -> void:
	queue_free()

func _physics_process(delta: float) -> void:
	_velocity.y *= gravity * delta
	if is_on_wall():
		_velocity.x *= -1.0
	_velocity.y = move_and_slide(_velocity, FLOOR_NORMAL).y

func _die() -> void:
	PlayerData.score += score
	queue_free()






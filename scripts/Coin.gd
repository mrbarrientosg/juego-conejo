extends Area2D

onready var anim_player: AnimationPlayer = $AnimationPlayer

export var score: int = 10

func _ready() -> void:
	$skin.play()
	set_process(false)
	set_physics_process(false)

func _on_body_entered(body: Node) -> void:
	anim_player.play("fade_out")
	PlayerData.score += score

func _on_VisibilityEnabler2D_screen_exited() -> void:
	queue_free()

extends Area2D

onready var anim_player: AnimationPlayer = $AnimationPlayer

export var score: int = 10

func _ready() -> void:
	$skin.play()

func _on_body_entered(body: Node) -> void:
	anim_player.play("fade_out")
	PlayerData.score += score

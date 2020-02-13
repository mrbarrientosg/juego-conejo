tool
extends Area2D

export var next_scene: PackedScene

onready var anim_player: AnimationPlayer = $AnimationPlayer

func _on_body_entered(body: Node) -> void:
	body.speed.x = 0.0
	body.get_node("skin").stop()
	_teleport()

func _get_configuration_warning() -> String:
	return "The next scene property can not be empty." if not next_scene else ""

func _teleport() -> void:
	anim_player.play("fade_in")
	yield(anim_player, "animation_finished")
	get_tree().change_scene_to(next_scene)

extends Control

onready var scene_tree: SceneTree = get_tree()
onready var pause_overlay: ColorRect = $PauseOverlay
onready var score: Label = $Label

var paused: bool = false setget set_paused

func _ready() -> void:
	PlayerData.connect("score_updated", self, "update_interface")
	update_interface()

func update_interface() -> void:
	score.text = "Score: %s" % PlayerData.score

func set_paused(value: bool) -> void:
	paused = value
	pause_overlay.visible = value
	scene_tree.paused = value

func _on_Pause_pressed() -> void:
	self.paused = not paused

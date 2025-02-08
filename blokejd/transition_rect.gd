extends ColorRect

# Path to the next scene to transition to
@export var next_scene_path: PackedScene

# Reference to the _AnimationPlayer_ node
@onready var _anim_player := $Fade


func _ready() -> void:
	$Fade.play_backwards("new_animation")
	
func transition_to(_next_scene := next_scene_path) -> void:
	# Plays the Fade animation and wait until it finishes
	_anim_player.play("new_animation")
	await _anim_player.animation_finished
	# Changes the scene
	get_tree().change_scene_to_packed(_next_scene)
	_anim_player.play_backwards("new_animation")
	

extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func transition_to(_next_scene: PackedScene, i: int) -> void:
	# Plays the Fade animation and wait until it finishes
	Input.set_custom_mouse_cursor(null)
	Inventory.visible = false
	$Animation.play(str(i))
	if($Animation.animation == str(i)):
		$Animation.visible = true
		get_tree().get_first_node_in_group("level").visible = false
		
		await $Animation.animation_finished
	$Animation.visible = false
	Inventory.visible = true
	# Changes the scene
	get_tree().change_scene_to_packed(_next_scene)

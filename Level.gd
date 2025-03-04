extends Node2D
class_name Level

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Inventory.visible = true
	Input.set_custom_mouse_cursor(null)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

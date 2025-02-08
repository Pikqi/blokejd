extends TextureRect
class_name InventoryHint
var is_selected = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(is_selected):
		if $ColorRect != null:
			$ColorRect.visible = false
	else:
		if $ColorRect != null:
			$ColorRect.visible = true
			


func _on_gui_input(event: InputEvent) -> void:
	if(event.is_action_pressed("mouse_1")):
		var hints = get_tree().get_nodes_in_group("inventory_hint")
		for hint: InventoryHint in hints:
			hint.is_selected = false
		is_selected = true

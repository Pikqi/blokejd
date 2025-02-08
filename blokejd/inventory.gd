extends CanvasLayer



const INVETORY_HINT = preload("res://invetory_hint.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func add_hint_to_inventory(name: String, image: Texture2D):
	var t = INVETORY_HINT.instantiate()
	t.texture = image
	$HBoxContainer.add_child(t)
	var hints = get_tree().get_nodes_in_group("inventory_hint")
	for hint: InventoryHint in hints:
		hint.is_selected = false
	t.is_selected = true

func reset():
	for childd in $HBoxContainer.get_children():
		$HBoxContainer.remove_child(childd)

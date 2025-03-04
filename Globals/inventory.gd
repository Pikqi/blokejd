extends CanvasLayer



const INVETORY_HINT = preload("res://components/invetory_hint.tscn")
# Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#visible = false
	#if get_tree().get_node_count_in_group("menu") == 0: 
		#visible = true;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func add_hint_to_inventory(name: String, image: Texture2D):
	var t = INVETORY_HINT.instantiate()
	print_debug(image)
	#t.texture = image
	t.letter = name
	#print_debug(t.texture)
	%HBoxContainer.add_child(t)
	var hints = get_tree().get_nodes_in_group("inventory_hint")
	for hint: InventoryHint in hints:
		hint.is_selected = false
	t.is_selected = true

func reset():
	for childd in %HBoxContainer.get_children():
		%HBoxContainer.remove_child(childd)
func get_selected_letter():
	for childd: InventoryHint in %HBoxContainer.get_children():
		if childd.is_selected:
			return childd.letter


func _on_texture_button_pressed() -> void:
	LevelController.reset_words()

extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var hints= get_tree().get_nodes_in_group("hint")
	for hint:Hint in hints:
		hint.hint_clicked.connect(on_hint_clicked.bind(hint))


func on_hint_clicked(hint: Hint):
	$Inventory.add_hint_to_inventory("temp", hint.image)
	get_tree().queue_delete(hint)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

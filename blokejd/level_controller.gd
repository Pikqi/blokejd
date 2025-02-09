extends Node2D

const LEVEL_2 = preload("res://Levels/level_2.tscn")

var words

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func on_hint_clicked(hint: Hint): 
	Inventory.add_hint_to_inventory(hint.letter, hint.image)
	get_tree().queue_delete(hint)
	
func level_passed():
	(get_tree().get_first_node_in_group("character") as Character).start_walk()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func handle_character_exited():
	TransitionRect.transition_to(LEVEL_2)
	(get_tree().get_first_node_in_group("character") as  Character).is_moving = false
	pass

func new_scene():
	(get_tree().get_first_node_in_group("character") as  Character).character_exited.connect(handle_character_exited)
	var hints= get_tree().get_nodes_in_group("hint")
	for hint:Hint in hints:
		hint.hint_clicked.connect(on_hint_clicked.bind(hint))
	(get_tree().get_first_node_in_group("word") as  Words).win.connect(level_passed)

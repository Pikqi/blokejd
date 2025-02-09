extends Node2D

const LEVEL_1 = preload("res://Levels/Level1.tscn")
const LEVEL_2 = preload("res://Levels/level_2.tscn")

var level = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if get_tree().get_nodes_in_group("level").size() < 1:
		TransitionRect.transition_to(LEVEL_1)


func on_hint_clicked(hint: Hint): 
	Inventory.add_hint_to_inventory(hint.letter, hint.image)
	get_tree().queue_delete(hint)
	
func level_passed():
	(get_tree().get_first_node_in_group("level")).level_won()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func handle_character_exited():
	level += 1
	match level:
		1:
			TransitionRect.transition_to(LEVEL_1)
		2:
			TransitionRect.transition_to(LEVEL_2)
		_:
			level = 1
			TransitionRect.transition_to(LEVEL_1) 
		#3:
			#TransitionRect.transition_to(LEVEL_3)
	(get_tree().get_first_node_in_group("character") as  Character).is_moving = false
	pass

func new_scene():
	Inventory.reset()
	(get_tree().get_first_node_in_group("character") as  Character).character_exited.connect(handle_character_exited)
	var hints= get_tree().get_nodes_in_group("hint")
	print_debug("hints: ", hints)
	for hint:Hint in hints:
		hint.hint_clicked.connect(on_hint_clicked.bind(hint))
	(get_tree().get_first_node_in_group("word") as  Words).win.connect(level_passed)

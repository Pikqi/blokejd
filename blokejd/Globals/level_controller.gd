extends Node2D

const LEVEL_1 = preload("res://Levels/Level1.tscn")
const LEVEL_2 = preload("res://Levels/level_2.tscn")
var PROLOUGE_DIAOG = load("res://dialogues/prologue.dialogue")
var TUTORIAL_DIAOG = load("res://dialogues/tutorial.dialogue")
var level1_DIALOG = load("res://dialogues/level1.dialogue")

var level = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#var dialogue_line = await PROLOUGE_DIAOG.get_next_dialogue_line("start")
	#print_debug(dialogue_line)
	if get_tree().get_nodes_in_group("level").size() < 1:
		await TransitionRect.transition_to(LEVEL_1)
	# ??? ORDER?
	#await DialogueManager.show_dialogue_balloon(TUTORIAL_DIAOG, "start")
	#await DialogueManager.show_dialogue_balloon(PROLOUGE_DIAOG, "start")
	#

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("restart"):
		var words = get_tree().get_nodes_in_group("word")
		print_debug(words)
		for word: Words in words:
			word.reset()

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
			await TransitionRect.transition_to(LEVEL_1)
			DialogueManager.show_dialogue_balloon(level1_DIALOG, "start")

		2:
			await TransitionRect.transition_to(LEVEL_2)
			DialogueManager.show_dialogue_balloon(level1_DIALOG, "start")
		_:
			level = 1
			TransitionRect.transition_to(LEVEL_1) 
		#3:
			#TransitionRect.transition_to(LEVEL_3)
	pass

func new_scene():
	Inventory.reset()
	(get_tree().get_first_node_in_group("character") as  Character).character_exited.connect(handle_character_exited)
	var hints= get_tree().get_nodes_in_group("hint")
	print_debug("hints: ", hints)
	for hint:Hint in hints:
		hint.hint_clicked.connect(on_hint_clicked.bind(hint))
	(get_tree().get_first_node_in_group("word") as  Words).win.connect(level_passed)

extends Node2D

const LEVEL_1 = preload("res://Levels/Level1.tscn")
const LEVEL_2 = preload("res://Levels/level_2.tscn")
const PROLOUGE = preload("res://Levels/prolouge.tscn")
const TUTORIJAL = preload("res://Levels/tutorijal.tscn")
var scenes: Array[PackedScene] = [PROLOUGE,TUTORIJAL, LEVEL_1, LEVEL_2]
var level = 0
@export var enable_dialogs = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Inventory.visible = false;
	#var dialogue_line = await PROLOUGE_DIAOG.get_next_dialogue_line("start")
	#print_debug(dialogue_line)
	# ??? ORDER?
	#await DialogueManager.show_dialogue_balloon(TUTORIAL_DIAOG, "start")
	#await DialogueManager.show_dialogue_balloon(PROLOUGE_DIAOG, "start")
	#

func start_game():
	await TransitionRect.transition_to(scenes[0])


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("restart"):
		var words = get_tree().get_nodes_in_group("word")
		for word  in words:
			if word.has_method("reset"):
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
	if(level >= scenes.size()):
		return
	TransitionRect.transition_to(scenes[level])
	pass

func new_scene():
	Inventory.reset()
	(get_tree().get_first_node_in_group("character") as  Character).character_exited.connect(handle_character_exited)
	var hints= get_tree().get_nodes_in_group("hint")
	print_debug("hints: ", hints)
	for hint:Hint in hints:
		hint.hint_clicked.connect(on_hint_clicked.bind(hint))
	var words =  (get_tree().get_first_node_in_group("word") as  Words)
	if words is Words:
		words.win.connect(level_passed)

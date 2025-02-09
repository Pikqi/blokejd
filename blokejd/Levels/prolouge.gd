extends Node2D

const PROLOGUE = preload("res://dialogues/prologue.dialogue")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	LevelController.new_scene()
	DialogueManager.show_dialogue_balloon(PROLOGUE)
	DialogueManager.dialogue_ended.connect(level_won)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func level_won(r:DialogueResource):
	$Karakter.scale.x = -$Karakter.scale.x
	$Karakter.start_walk()

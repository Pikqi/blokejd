extends Node2D
const LEVEL_1 = preload("res://dialogues/level1.dialogue")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	LevelController.new_scene()
	DialogueManager.show_dialogue_balloon(LEVEL_1)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func level_won():
	$Vulture/AnimatedSprite2D.play("end")
	await $Vulture/AnimatedSprite2D.animation_finished
	$Vulture/AnimatedSprite2D.play("end_idle")
	$Karakter.start_walk()

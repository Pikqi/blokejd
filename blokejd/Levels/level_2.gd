extends Level
const LEVEL_2 = preload("res://dialogues/level2.dialogue")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	LevelController.new_scene()
	DialogueManager.show_dialogue_balloon(LEVEL_2)
	super()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func level_won():
	$Goblin/AnimatedSprite2D.play("end")
	await $Goblin/AnimatedSprite2D.animation_finished
	$Karakter.start_walk()

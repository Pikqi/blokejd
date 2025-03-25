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
	$Goblin/AnimatedSprite2D.play("end1")
	SoundManager.play_sound("gvozdje_u_grozdje")
	await $Goblin/AnimatedSprite2D.animation_finished
	SoundManager.play_sound("goblini_beze")
	$Goblin/AnimatedSprite2D.play("end2")
	
	await $Goblin/AnimatedSprite2D.animation_finished
	$Karakter.start_walk()
	SoundManager.play_sound("walking_stone")

func _exit_tree() -> void:
	SoundManager.stop_sound("walking_stone")

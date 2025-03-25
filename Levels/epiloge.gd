extends Level

const SECRECT_ENDING = preload("res://dialogues/secrect_ending.dialogue")
const EPILOG = preload("res://dialogues/epilog.dialogue")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	LevelController.new_scene()

	super()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func level_won():
	if $Words.text == 'slama':
		$LamaAnimation.visible = false
		$SlamaAnimation.visible = true
		$SlamaAnimation.play("slama")
		await $SlamaAnimation.animation_finished
		DialogueManager.show_dialogue_balloon(EPILOG)
		$SlamaAnimation.play("slama-idle")
	elif $Words.text == " dama":
		$LamaAnimation.visible = false
		$DamaAnimation.visible = true
		$DamaAnimation.play("dama")
		await $DamaAnimation.animation_finished
		DialogueManager.show_dialogue_balloon(SECRECT_ENDING)
	#$RuneAnimation.visible = true
#
	#$RuneAnimation.play("Destroy")
	#SoundManager.play_sound("rune_shooting")
	#await $RuneAnimation.animation_finished
	#SoundManager.play_sound("door_expoding")
	#$Karakter.character_exited.emit()

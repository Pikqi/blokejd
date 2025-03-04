extends Level


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	LevelController.new_scene()
	super()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func level_won():
	$RuneAnimation.play("Destroy")
	SoundManager.play_sound("rune_shooting")
	await $RuneAnimation.animation_finished
	SoundManager.play_sound("door_expoding")
	
	await $Goblin/AnimatedSprite2D.animation_finished
	$Karakter.start_walk()
	SoundManager.play_sound("walking_stone")

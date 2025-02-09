extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	LevelController.new_scene()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func level_won():
	$Goblin/AnimatedSprite2D.play("end")
	await $Goblin/AnimatedSprite2D.animation_finished
	$Karakter.start_walk()

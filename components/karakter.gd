extends CharacterBody2D
class_name Character
@export var SPEED: int = 300
@export var is_moving = false
var exited = false
signal character_exited

func _physics_process(delta: float) -> void:
	if is_moving:
		global_position.x += SPEED * delta
	if global_position.x > get_viewport_rect().size.x and exited == false:
		exited = true
		character_exited.emit()
func start_walk():
	is_moving = true
	$AnimatedSprite2D.play("walk")
func stop_walking():
	is_moving = false
	$AnimatedSprite2D.play("default")

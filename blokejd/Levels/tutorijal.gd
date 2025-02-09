extends Node2D

const O = preload("res://assets/O.png")
const TUTORIAL = preload("res://dialogues/tutorial.dialogue")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	LevelController.new_scene()
	$Words2.win.connect(level_won)
	DialogueManager.show_dialogue_balloon(TUTORIAL)
	#DialogueManager.dialogue_ended.connect(done)
	#
#func done (r):
	#$Karakter.is_moving = true	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Character:
		$Karakter.is_moving = false
		$Timer.start()


func _on_timer_timeout() -> void:
	LevelController.handle_character_exited()

func level_won():
		$Karakter.is_moving = true

func _on_hint_hack_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event.is_action_pressed("mouse_1"):
		Inventory.add_hint_to_inventory("o", null)

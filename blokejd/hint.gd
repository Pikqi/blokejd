extends Node2D
class_name Hint

@export var image: Texture2D
@export var letter: String

signal hint_clicked

func _ready() -> void:
	$Icon.texture = image
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	print_debug("v")
	
	if(event.is_action_pressed("mouse_1")):
		print_debug("lala")
		hint_clicked.emit()
		

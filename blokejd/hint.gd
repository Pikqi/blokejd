extends Node2D
@export var image: Texture2D

func _ready() -> void:
	$Icon.texture = image
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if(event.is_action_pressed("mouse_1")):
		print_debug("lala")

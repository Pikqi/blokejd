extends Node2D


@export var text: String = "test"
@export var width = 10
@onready var text_size = text.length()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var i = 0
	for char in text:
		var ascii = char.unicode_at(0) - "a".unicode_at(0)
		var row = ascii / width
		var col = ascii % width
		
		$TileMapLayer.set_cell(Vector2(i,0), 0, Vector2(col,row))
		i+=1
	
func _input(event: InputEvent) -> void:
	if(event.is_action_pressed("mouse_1")):
		var r = $TileMapLayer.local_to_map(get_local_mouse_position() / $TileMapLayer.scale )
		if(r.x < text_size and r.y == 0):
			handle_letter_pressed(r.x)
			print_debug(r)
			

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func handle_letter_pressed(index: int):
	$TileMapLayer.set_cell(Vector2(index,0), 0, Vector2(0,0))
	pass

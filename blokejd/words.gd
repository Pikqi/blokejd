extends Node2D
class_name Words

@export var init_text: String = "test"
@export var wanted: String = "best"
@export var width = 10
@onready var text_size = init_text.length()
@onready var text = init_text

signal win 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	draw_text()
	
func _input(event: InputEvent) -> void:
	if(event.is_action_pressed("mouse_1")):
		var r = $TileMapLayer.local_to_map(get_local_mouse_position() / $TileMapLayer.scale )
		if(r.x >= 0 and r.x < text_size and r.y == 0):
			handle_letter_pressed(r.x)

func draw_text():
	var i = 0
	for char in text:
		var ascii = char.unicode_at(0) - "a".unicode_at(0)
		var row = ascii / width
		var col = ascii % width
		
		$TileMapLayer.set_cell(Vector2(i,0), 0, Vector2(col,row))
		i+=1

func _process(delta: float) -> void:
	pass

func handle_letter_pressed(index: int):
	var selected_letter = Inventory.get_selected_letter()
	if(selected_letter == null or selected_letter == ""):
		pass
		
	var ascii = selected_letter.to_lower().unicode_at(0) - "a".unicode_at(0)
	var row = ascii / width
	var col = ascii % width
	$TileMapLayer.set_cell(Vector2(index,0), 0, Vector2(col, row))
	var buff := text.to_ascii_buffer()
	buff[index] = selected_letter.to_lower().to_ascii_buffer()[0]
	text = buff.get_string_from_ascii()
	
	if(text == wanted):
		win.emit()
		print_debug("win")

func reset():
	text = init_text

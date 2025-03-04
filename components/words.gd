extends Node2D
class_name Words

@export var init_text: String = "đamu"
@export var wanted: String = "best"
@export var width = 10
@onready var text_size = init_text.length()
@onready var text = init_text

signal win 
var won = false

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
	var row
	var col
	for char in text:
		var coords = charToCoord(char)
		$TileMapLayer.set_cell(Vector2(i,0), 0, coords)
		i+=1

func _process(delta: float) -> void:
	pass
	
func charToCoord(char: String)-> Vector2:
	var row
	var col
	if(char == "đ"):
			row = 2
			col = 9
	else:
		var ascii = char.unicode_at(0) - "a".unicode_at(0)
		row = ascii / width
		col = ascii % width
	return Vector2(col, row)

func handle_letter_pressed(index: int):
	var selected_letter = Inventory.get_selected_letter()
	if(selected_letter == null or selected_letter == ""):
		return
	
	var coords = charToCoord(selected_letter)
	
	$TileMapLayer.set_cell(Vector2(index,0), 0, coords)
	var buff := text.to_utf8_buffer()
	buff[index] = selected_letter.to_lower().to_utf8_buffer()[0]
	text = buff.get_string_from_utf8()
	
	if(text == wanted):
		win.emit()
		won = true
		print_debug("win")

func reset():
	if won:
		return
	text = init_text
	draw_text()

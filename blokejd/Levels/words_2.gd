extends Node2D
class_name Words_2

@export var init_text: String = "zatvoreno"
@export var width = 10
@onready var text_size = init_text.length()
@onready var text = init_text

signal win 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	draw_text()
	
func _input(event: InputEvent) -> void:
	if(event.is_action_pressed("mouse_1")):
		var letter = Inventory.get_selected_letter() 
		if letter != null and letter.to_lower() == "o":
			text = "otvoreno"
			draw_text()
			win.emit() 

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

func reset():
	text = init_text
	draw_text()

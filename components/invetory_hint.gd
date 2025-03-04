extends TextureRect
class_name InventoryHint
var is_selected = false
@export var letter: String
const LETTERS_TILESET = preload("res://TileSets/lettersTileset.tres")
# Called when the node enters the scene tree for the first time.

var letter_image:Image = null
func _ready() -> void:
	$Label.text = letter
	var ascii = letter.unicode_at(0) - "a".unicode_at(0)
	var row = ascii / 10
	var col = ascii % 10
	
	var a = LETTERS_TILESET.get_source(0) as TileSetAtlasSource
	var im := a.texture.get_image() as Image
	var image = im.get_region(a.get_tile_texture_region(Vector2(col, row)))
	letter_image = image
	letter_image.resize(50, 50)
	Input.set_custom_mouse_cursor(letter_image)
	
	var image_texture = ImageTexture.create_from_image(image)
	
	texture = image_texture
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(is_selected):
		if $ColorRect != null:
			$ColorRect.visible = true
	else:
		if $ColorRect != null:
			$ColorRect.visible = false
			

func _on_gui_input(event: InputEvent) -> void:
	if(event.is_action_pressed("mouse_1")):
		var hints = get_tree().get_nodes_in_group("inventory_hint")
		for hint: InventoryHint in hints:
			hint.is_selected = false
		is_selected = true
		
		Input.set_custom_mouse_cursor(letter_image)

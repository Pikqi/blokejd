extends Node
@onready var game_start: AudioStreamPlayer = $GameStart
@onready var door_opening: AudioStreamPlayer = $DoorOpening
@onready var gej_dzem: AudioStreamPlayer = $GejDzem
@onready var goblini_beze: AudioStreamPlayer = $GobliniBeze
@onready var gvozdje_u_grozdje: AudioStreamPlayer = $GvozdjeUGrozdje
@onready var kost_pada: AudioStreamPlayer = $KostPada
@onready var rune_shooting: AudioStreamPlayer = $RuneShooting
@onready var walking_grass: AudioStreamPlayer = $WalkingGrass
@onready var walking_stone: AudioStreamPlayer = $WalkingStone


func play_sound(key):
	var sound = get(key)
	if sound is AudioStreamPlayer:
		sound.play()
	else:
		print("sound " + key + " not found!")
func stop_sound(key):
	var sound = get(key)
	if sound is AudioStreamPlayer:
		sound.stop()
	else:
		print("sound " + key + " not found!")

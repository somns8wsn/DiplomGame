extends Node2D

onready var tape_recorder_fixed_osnova = load("res://Sprites/taperecorder/tape_recorder_fixed_osnova.png")
onready var tape_recorder_fixed_play = load("res://Sprites/taperecorder/tape_recorder_fixed_play.png")
onready var tape_recorder_fixed_pause = load("res://Sprites/taperecorder/tape_recorder_fixed_pause.png")
onready var tape_recorder_fixed_stop = load("res://Sprites/taperecorder/tape_recorder_fixed_stop.png")
onready var tape_recorder_fixed_music_back = load("res://Sprites/taperecorder/tape_recorder_fixed_music_back.png")
onready var tape_recorder_fixed_music_next = load("res://Sprites/taperecorder/tape_recorder_fixed_music_next.png")
onready var tape_recorder_fixed_music_stop_button_clicked = load("res://Sprites/taperecorder/tape_recorder_fixed_music_stop_button_clicked.png")

#onready var music_by_Alexey_Sdacha_inst = load("res://song/PlayerMusic/music_by_Alexey_Sdacha_inst.mp3")
var temp: float


func _on_ClickPlay_pressed():
	$TapeRecorderOsnova.texture = tape_recorder_fixed_play
	$AudioStreamPlayerSdachaInst.play()
	$AudioStreamPlayerSdachaInst.seek(temp)
	temp = 0


func _on_ClickPause_pressed():
	$TapeRecorderOsnova.texture = tape_recorder_fixed_pause
	temp = $AudioStreamPlayerSdachaInst.get_playback_position()
	#print(temp)
	$AudioStreamPlayerSdachaInst.stop()
	$AudioStreamPlayerSovestInst.stop()

func _on_ClickStop_button_down():
	$TapeRecorderOsnova.texture = tape_recorder_fixed_osnova
	$AudioStreamPlayerSdachaInst.stop()
	$AudioStreamPlayerSovestInst.stop()
	#$TapeRecorderOsnova.texture = tape_recorder_fixed_stop


func _on_ClickMusicBack_button_down():
	$TapeRecorderOsnova.texture = tape_recorder_fixed_play
	$AudioStreamPlayerSdachaInst.play()
	$AudioStreamPlayerSovestInst.stop()

func _on_ClickMusicNext_button_down():
	$TapeRecorderOsnova.texture = tape_recorder_fixed_play
	$AudioStreamPlayerSovestInst.play()
	$AudioStreamPlayerSdachaInst.stop()

extends Node2D

onready var MplayerOsnovaPlay = load("res://Sprites/musicplayer/MplayerOsnovaPlay.png")
onready var MplayerOsnovaPause = load("res://Sprites/musicplayer/MplayerOsnovaPause.png")
onready var MplayerOsnovaRewindBack = load("res://Sprites/musicplayer/MplayerOsnovaRewindBack.png")
onready var MplayerOsnovaRewindGo = load("res://Sprites/musicplayer/MplayerOsnovaRewindGo.png")

onready var MusicForPlayer1 = load("res://song/PlayerMusic/MusicForPlayer1.mp3")
var temp: float

func _on_ClickPlay_pressed():
	$MusicOsnova.texture = MplayerOsnovaPlay
	$AudioStreamPlayerSdachaInst.play()
	$AudioStreamPlayerSdachaInst.seek(temp)
	temp = 0

func _on_ClickPause_pressed():
	$MusicOsnova.texture = MplayerOsnovaPause
	temp = $AudioStreamPlayerSdachaInst.get_playback_position()
	#print(temp)
	$AudioStreamPlayerSdachaInst.stop()
	$AudioStreamPlayerSovestInst.stop()


func _on_ClickBack_pressed():
	$MusicOsnova.texture = MplayerOsnovaRewindBack
	$AudioStreamPlayerSdachaInst.play()
	$AudioStreamPlayerSovestInst.stop()
	#var back = $AudioStreamPlayer1.get_playback_position() - rewind
	#$AudioStreamPlayer1.seek(back)


func _on_ClickGo_pressed():
	$MusicOsnova.texture = MplayerOsnovaRewindGo
	$AudioStreamPlayerSovestInst.play()
	$AudioStreamPlayerSdachaInst.stop()
	#var forward = $AudioStreamPlayer1.get_playback_position() + rewind
	#$AudioStreamPlayer1.seek(forward)

extends Node2D

onready var MplayerOsnovaPlay = load("res://Sprites/musicplayer/MplayerOsnovaPlay.png")
onready var MplayerOsnovaPause = load("res://Sprites/musicplayer/MplayerOsnovaPause.png")
onready var MplayerOsnovaRewindBack = load("res://Sprites/musicplayer/MplayerOsnovaRewindBack.png")
onready var MplayerOsnovaRewindGo = load("res://Sprites/musicplayer/MplayerOsnovaRewindGo.png")

onready var MusicForPlayer1 = load("res://song/PlayerMusic/MusicForPlayer1.mp3")
var temp: float
var rewind: float = 1.0

func _on_ClickPlay_pressed():
	$MusicOsnova.texture = MplayerOsnovaPlay
	$AudioStreamPlayer.play()
	$AudioStreamPlayer.seek(temp)
	temp = 0

func _on_ClickPause_pressed():
	$MusicOsnova.texture = MplayerOsnovaPause
	temp = $AudioStreamPlayer.get_playback_position()
	#print(temp)
	$AudioStreamPlayer.stop()


func _on_ClickRewindBack_pressed():
	$MusicOsnova.texture = MplayerOsnovaRewindBack
	var back = $AudioStreamPlayer.get_playback_position() - rewind
	$AudioStreamPlayer.seek(back)


func _on_ClickRewindGo_pressed():
	$MusicOsnova.texture = MplayerOsnovaRewindGo
	var forward = $AudioStreamPlayer.get_playback_position() + rewind
	$AudioStreamPlayer.seek(forward)

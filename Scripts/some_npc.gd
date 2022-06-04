extends KinematicBody2D

var mass := 1000.0
var vel := Vector2()

const MAX_SPEED := 100


func _process(_delta) -> void:
	pass

func _physics_process(delta) -> void:

	vel.y += mass * delta + 25

	vel = move_and_slide(vel, Vector2.UP)

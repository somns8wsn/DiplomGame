extends KinematicBody2D

var vel := Vector2.ZERO # movement direction
var state = State.IDLE # current player state
var particles := preload("res://Scenes/run_particles.tscn")
var speed: float = 400.0
var speed_mult: float = 0.5


signal run

enum State{ # all possible player states
	IDLE,
	RUN,
	SPRINT,
	TALKING,
}

class input: # player control check
	static func right() -> bool:
		return Input.is_action_pressed("ui_right")
	static func just_right() -> bool:
		return Input.is_action_just_pressed("ui_right")
	static func just_right_release() -> bool:
		return Input.is_action_just_released("ui_right")

	static func left() -> bool:
		return Input.is_action_pressed("ui_left")
	static func just_left() -> bool:
		return Input.is_action_just_pressed("ui_left")
	static func just_left_release() -> bool:
		return Input.is_action_just_released("ui_left")

	static func down() -> bool:
		return Input.is_action_pressed("ui_down")
	static func just_down() -> bool:
		return Input.is_action_just_pressed("ui_down")
	static func just_down_release() -> bool:
		return Input.is_action_just_released("ui_down")

	static func up() -> bool:
		return Input.is_action_pressed("ui_up")
	static func just_up() -> bool:
		return Input.is_action_just_pressed("ui_up")
	static func just_up_release() -> bool:
		return Input.is_action_just_released("ui_up")

	static func sprint() -> bool:
		return Input.is_action_pressed("ui_sprint")
	static func stop_sprinting() -> bool:
		return Input.is_action_just_released("ui_sprint")

	static func jump() -> bool:
		return Input.is_action_just_pressed("ui_jump")

#####################################

func topdown_movement(_delta: float) -> void:

	if input.right():
		state = State.RUN
		#$run_particles.rotation_degrees = 90
		vel.x = speed
		if input.up():
			vel.y = -speed * speed_mult
		elif input.down():
			vel.y = speed * speed_mult

	elif input.left():
		#$run_particles.rotation_degrees = -90
		state = State.RUN
		vel.x = -speed
		if input.up():
			vel.y = -speed * speed_mult
		elif input.down():
			vel.y = speed * speed_mult

	elif input.up():
		state = State.RUN
		vel.y = -speed
		if input.left():
			vel.x = -speed * speed_mult
		elif input.right():
			vel.x = speed * speed_mult

	elif input.down():
		state = State.RUN
		vel.y = speed
		if input.left():
			vel.x = -speed * speed_mult
		elif input.right():
			vel.x = speed * speed_mult

	else:
		state = State.IDLE
		vel.x = 0
		vel.y = 0

	vel = move_and_slide(vel, Vector2.ZERO).normalized()

func topdown_mouse_track(_delta: float) -> void: # player's texture always face-tracking cursor

	var mouse := get_global_mouse_position()
	var rad := get_angle_to(mouse) # get cursor angle relative to player node
	var radians_to_degrees = rad * (180 / PI)
	var nodes = [$walk_sprite,$occluder,$collision]
	#print(rad2deg(self.get_angle_to(vel)))
	#$walk_sprite.rotation_degrees = rad2deg(get_angle_to(Vector2(100,200)))
	for i in nodes:
		i.rotation_degrees = 90 + radians_to_degrees

func animations():
	if state == State.RUN:
		$animation.current_animation = "walk"
	elif state == State.IDLE:
		$animation.current_animation = "[stop]"

func _process(_delta: float) -> void:
	topdown_mouse_track(_delta)
	animations()

	#$run_particles.emitting = true if is_moving() else false

func is_moving() -> bool:
	if vel.x != 0 or vel.y != 0:
		return true
	else:
		return false

func _physics_process(_delta: float) -> void:
		if is_moving():
			emit_signal("run")



		topdown_movement(_delta)
		topdown_mouse_track(_delta)

func _on_wooden_chair_player_sat() -> void:
	pass#print("work")


func _on_topdown_player_run() -> void:
	var p = particles.instance()
	add_child(p)#.set_emitting(true))
	p.z_index = -1


	if p.emitting == false:
		p.queue_free()
	pass

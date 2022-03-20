extends KinematicBody2D

var mass := 1000.0
var vel := Vector2()

const MAX_SPEED = 300
const SPRINT_SPEED = MAX_SPEED*1.5

enum State{ # all possible player states
	IDLE,
	RUN,
	SPRINT,
	JUMP,
	DUCK,
	SITTING,
	LAY,
	CLIMBING,
	TALKING,
}

var state = State.IDLE


class input:
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


func movement(MAX_SPEED: float, _delta: float) -> void:

	if input.right():
		state = State.RUN
		vel.x = MAX_SPEED
		if input.sprint():
			state = State.SPRINT
			vel.x = SPRINT_SPEED
			if input.stop_sprinting():
				vel.x = MAX_SPEED

	elif input.left():
		state = State.RUN
		vel.x = -MAX_SPEED
		if input.sprint():
			state = State.SPRINT
			vel.x = -SPRINT_SPEED
			if input.stop_sprinting():
				vel.x = -MAX_SPEED

	else:
		if input.just_right_release() or input.just_left_release():
			vel.x = 0
			state = State.IDLE


func ladder() -> void:

	if G.is_on_ladder:
		state = State.CLIMBING
		vel.y = 0
		

		if input.up():
			vel.y -= 100

		elif input.down():
			vel.y += 100

	else:
		state = State.IDLE

func duck() -> void:

	var is_ceiling_above : bool = $ceiling_check.is_colliding()

	if input.down() and is_on_floor():
		state = State.DUCK
		$idle_collision.disabled = true

	elif (input.just_down_release() and is_ceiling_above) or is_ceiling_above:
			state = State.DUCK
			$idle_collision.disabled = true

	elif !is_ceiling_above:
			state = State.IDLE
			$idle_collision.disabled = false

func jump() -> void:
	if state == State.IDLE:
		if input.jump() and is_on_floor():
			state = State.JUMP
			vel.y -= mass - 200
		elif vel.y == 0:
			state = State.IDLE

func movement_limitations() -> void: # to except possible bugs

	if input.left() and input.right():
		vel.x = 0

	if !input.just_right() and !input.just_left() and !input.left() and !input.right() and is_on_floor():
		vel.x = 0

func _process(_delta: float) -> void:

	"""
	Simply mirroring objects by negating their properties and their module.
	Cannot use 'flip_h/v' because of the position on the parent scene, which is !0,
	and also because of the 100% symmetric shape.
	"""

	var face: Node = $face
	var grap_area: Node = $grap_area
	var grap_collision: Node = $grap_collision
	var ceiling_check: Node = $ceiling_check

	if input.left():

		if face.position.x > 0:
			face.position.x = -face.position.x

		if grap_area.position.x > 0:
			grap_area.position.x = -grap_area.position.x

		if grap_collision.position.x > 0:
			grap_collision.position.x = -grap_collision.position.x


		ceiling_check.position.x = abs(ceiling_check.position.x)

		ceiling_check.rotation_degrees = abs(ceiling_check.rotation_degrees)


	if input.right():
		face.position.x = abs(face.position.x)

		grap_area.position.x = abs(grap_area.position.x)

		grap_collision.position.x = abs(grap_collision.position.x)

		if ceiling_check.position.x > 0:
			ceiling_check.position.x = -ceiling_check.position.x

		if ceiling_check.rotation_degrees > 0:
			ceiling_check.rotation_degrees = -ceiling_check.rotation_degrees

func _physics_process(delta: float) -> void:

	vel.y += mass * delta + 25
	#print(state)
	movement(MAX_SPEED, delta)
	ladder()
	duck()
	jump()
	movement_limitations()

	vel = move_and_slide(vel, Vector2.UP)

func _on_wooden_chair_player_sat() -> void:
	print("work")

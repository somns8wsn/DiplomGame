extends KinematicBody2D

const MAX_SPEED := 400
var mass := 1000
var vel := Vector2()

func _process(_delta):
	if Input.is_action_pressed("ui_left"):
		if $Sprite2.position.x > 0:
			$Sprite2.position.x = -$Sprite2.position.x
		if $grap_area.position.x > 0:
			$grap_area.position.x = -$grap_area.position.x
		if $KinematicBody2D.position.x > 0:
			$KinematicBody2D.position.x = -$KinematicBody2D.position.x
		
	if Input.is_action_pressed("ui_right"):
		$Sprite2.position.x = abs($Sprite2.position.x)
		$grap_area.position.x = abs($grap_area.position.x)
		$KinematicBody2D.position.x = abs($KinematicBody2D.position.x)
		
	if !Input.is_action_just_pressed("ui_right") or !Input.is_action_just_pressed("ui_left") or !Input.is_action_pressed("ui_left") or !Input.is_action_pressed("ui_right"):
		vel.x = 0
		
func movement_right(MAX_SPEED):

	if Input.is_action_pressed("ui_right"):
		
		vel.x = MAX_SPEED
		
	elif Input.is_action_just_released("ui_right"):
			
			vel.x = 0
			
func movement_left(MAX_SPEED):

	if Input.is_action_pressed("ui_left"):
		
		vel.x = -MAX_SPEED
		
	elif Input.is_action_just_released("ui_left"):
			
			vel.x = 0

func ladder():
	if G.is_on_ladder == true:
		vel.y = 0
		
		if Input.is_action_pressed("ui_up"):
			vel.y -= 100
			
		elif Input.is_action_pressed("ui_down"):
			vel.y += 100
			
		if $grap_area.position.x < 0:
			vel.x += 5
			
		if $grap_area.position.x > 0:
			vel.x -= 5
			
		if $KinematicBody2D.position.x < 0:
			vel.x += 5
			
		if $KinematicBody2D.position.x > 0:
			vel.x -= 5
			
		print(G.is_on_ladder)
	else:
		print(G.is_on_ladder)
		
func _physics_process(delta):

	
	vel.y += mass * delta + 25
	movement_right(MAX_SPEED)
	movement_left(MAX_SPEED)
	
	ladder()
		
	if Input.is_action_pressed("ui_left") and Input.is_action_pressed("ui_right"):
		vel.x = 0
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		vel.y -= mass - 200
		
	vel = move_and_slide(vel, Vector2.UP)

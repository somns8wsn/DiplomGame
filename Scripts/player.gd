extends KinematicBody2D

const MAX_SPEED := 400
var mass := 1000
var vel := Vector2()

func _process(_delta):
	if Input.is_action_pressed("ui_left"):
		if $Sprite2.position.x > 0:
			$Sprite2.position.x = -$Sprite2.position.x
			
		if $ladder_grap.position.x > 0:
			$ladder_grap.position.x = -$ladder_grap.position.x
		
	if Input.is_action_pressed("ui_right"):
		$Sprite2.position.x = abs($Sprite2.position.x)
		$ladder_grap.position.x = abs($ladder_grap.position.x)

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


func _physics_process(delta):

	
	vel.y += mass * delta + 25
	movement_right(MAX_SPEED)
	movement_left(MAX_SPEED)
	
	if G.is_on_ladder == true:
		if Input.is_action_pressed("ui_left") and Input.is_action_pressed("ui_up"):
			pass
		vel.x += 5
		print(G.is_on_ladder)
	else:
		print(G.is_on_ladder)
		
	if Input.is_action_pressed("ui_left") and Input.is_action_pressed("ui_right"):
		vel.x = 0
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		vel.y -= mass - 200
		
	vel = move_and_slide(vel, Vector2.UP)

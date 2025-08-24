extends CharacterBody3D

@onready var camera_pivot: Node3D = $CameraPivot
@onready var camera_3d: Camera3D = $CameraPivot/Camera3D


@export_range(0.0, 2.0) var sensitivity := .5

const SPEED = 5.0
const JUMP_VELOCITY = 4.5
const SENS_MULTIPLIER = 0.025

var has_focus

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("left_click"):
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
		has_focus = true
	if event.is_action_pressed("ui_cancel"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		has_focus = false
	
	if event is InputEventMouseMotion and has_focus:
		camera_pivot.rotate_y(-event.relative.x * sensitivity * SENS_MULTIPLIER)
		camera_3d.rotate_x(-event.relative.y * sensitivity * SENS_MULTIPLIER)


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("move_left", "move_right", "move_forward", "move_back")
	var direction := (camera_pivot.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = 0
		velocity.z = 0
	if has_focus:
		move_and_slide()


func player():
	pass;

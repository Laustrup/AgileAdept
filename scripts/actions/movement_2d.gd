class_name Movement2D extends CharacterBody2D

@onready var input_manager: InputManager = get_parent() as InputManager

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	if input_manager.is_pressed(Action.Type.JUMP) and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	var direction := input_manager.get_axis()
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

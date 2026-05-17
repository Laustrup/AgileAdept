class_name InputManager extends Node2D

var activeSource: Source

signal source_of_input_changed(source: Source)

func get_movement_vector() -> Vector2:
	var vector
	
	match activeSource:
		Source.KEYBOARD:
			vector = Input.get_vector(
				get_action_name(Action.Type.UP),
				get_action_name(Action.Type.DOWN),
				get_action_name(Action.Type.LEFT),
				get_action_name(Action.Type.RIGHT)
			)
		_:
			vector = Vector2.ZERO
	
	return vector

func get_axis() -> float:
	var axis
	
	match activeSource:
		Source.KEYBOARD:
			axis = Input.get_axis(
				get_action_name(Action.Type.LEFT),
				get_action_name(Action.Type.RIGHT)
			)
		_:
			axis = 0
	
	return axis

func is_pressed(action_type: Action.Type) -> bool:
	return Input.is_action_pressed(get_action_name(action_type))

func _input(event: InputEvent) -> void:
	var source = source_type_of(event)
	set_input_source(source)

func set_input_source(source: Source) -> void:
	var isSameAsCurrentSource = activeSource == source
	if !isSameAsCurrentSource:
		activeSource = source
		print("Source of input changed to ", source)
		source_of_input_changed.emit(source)

func source_type_of(event: InputEvent) -> Source:
	var isKeyboard = event is InputEventKey or event is InputEventMouse
	return Source.KEYBOARD if isKeyboard else Source.CONTROLLER 

func get_action_name(action_type: Action.Type) -> String:
	return Action.types.get(action_type).action_name

enum Source {
	KEYBOARD,
	CONTROLLER
}

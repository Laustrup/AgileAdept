extends Node

const types := {
	Type.UP: {"action_name": "up"},
	Type.DOWN: {"action_name": "down"},
	Type.LEFT: {"action_name": "left"},
	Type.RIGHT: {"action_name": "right"},
	Type.JUMP: {"action_name": "jump"}
}

enum Type {
	UP,
	DOWN,
	LEFT,
	RIGHT,
	JUMP
}

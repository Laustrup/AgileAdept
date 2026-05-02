class_name SoundControl
extends SoundSlider

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	bus_index = 2
	prepare_slider_of_bus()

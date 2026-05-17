class_name SoundControl
extends SoundSlider

@onready var mute: Button = $"../Button" as Button

func _ready() -> void:
	bus_index = 2
	prepare_slider_of_bus(mute)

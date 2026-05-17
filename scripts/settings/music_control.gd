class_name MusicControl
extends SoundSlider

@onready var mute: Button = $"../Button" as Button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	bus_index = 1
	prepare_slider_of_bus(mute)

func _on_value_changed(value: float) -> void:
	change_value_of_bus(value, mute)

func _on_button_pressed() -> void:
	sound_on_or_off(mute)

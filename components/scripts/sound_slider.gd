class_name SoundSlider
extends HSlider

@export var audio_bus_name: String
var bus_index: int

func _ready() -> void:
	bus_index = -1

func prepare_slider_of_bus() -> void:
	if bus_index < 0:
		return
	
	value = Sounds.SOUND_OFFSET
	audio_bus_name = AudioServer.get_bus_name(bus_index)
	change_value_of_bus(value)
	print("Slider has been prepared with bus: %s with offset %s" % [audio_bus_name, value])

func change_value_of_bus(value: float) -> void:
	if AudioServer.is_bus_mute(bus_index):
		sound_on_or_off()
	var volume = linear_to_db(value)
	
	if volume > Sounds.SOUND_LINEAR_VOLUME_LIMIT:
		volume = Sounds.SOUND_LINEAR_VOLUME_LIMIT

	AudioServer.set_bus_volume_db(bus_index, volume)
	print("\nChanging sound\n\tvalue: %s\n\tvolume: %s\n" % [value, volume])

func sound_on_or_off() -> void:
	AudioServer.set_bus_mute(bus_index, !AudioServer.is_bus_mute(bus_index))

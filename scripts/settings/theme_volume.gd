extends HSlider


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var bus_index = AudioServer.get_bus_volume_db(1)
	value = db_to_linear(AudioServer.get_bus_volume_db(bus_index))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

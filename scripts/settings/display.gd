extends Panel

@onready var screen: OptionButton = $Container/ScreenControl/ScreenDropdownBox/DropbdownButtonControl/OptionButton as OptionButton
@onready var heightInput: SpinBox = $Container/ResolutionContainer/ResolutionHeightControl/ResolutionHeightFieldInput/InputControl/SpinBox as SpinBox
@onready var widthInput: SpinBox = $Container/ResolutionContainer/ResolutionWidthControl/ResolutionWidthFieldInput/InputControl/SpinBox as SpinBox

var default_screen_resolution: Vector2i = Vector2i(1280, 720)

var ScreenWindowModeOptions = {
	"Exclusive full screen": DisplayServer.WindowMode.WINDOW_MODE_EXCLUSIVE_FULLSCREEN,
	"Full screen": DisplayServer.WindowMode.WINDOW_MODE_FULLSCREEN,
	"Maximized": DisplayServer.WindowMode.WINDOW_MODE_MAXIMIZED,
	"Minimized": DisplayServer.WindowMode.WINDOW_MODE_MINIMIZED,
	"Windowed": DisplayServer.WindowMode.WINDOW_MODE_WINDOWED
}

func _ready() -> void:
	_on_screen_item_selected(screen.get_selectable_item())

func _on_screen_item_selected(index: int) -> void:
	var selectedMode = screen.get_item_text(index);
	var mode = ScreenWindowModeOptions[selectedMode]
	DisplayServer.window_set_mode(mode, 0)
	match mode:
		DisplayServer.WindowMode.WINDOW_MODE_MINIMIZED, DisplayServer.WindowMode.WINDOW_MODE_WINDOWED:
			$Container/ResolutionContainer.visible = true
			var window_size = DisplayServer.window_get_size(0)
			heightInput.value = window_size.y
			widthInput.value = window_size.x
		_:
			$Container/ResolutionContainer.visible = false

func _on_height_spin_box_value_changed(value: float) -> void:
	set_resolution(floor(value), floor(widthInput.value))

func _on_width_spin_box_value_changed(value: float) -> void:
	set_resolution(floor(heightInput.value), floor(value))

func _on_reset_resolution_button_pressed() -> void:
	heightInput.value = default_screen_resolution.y
	widthInput.value = default_screen_resolution.x

func set_resolution(height: int, width: int) -> void:
	DisplayServer.window_set_size(Vector2i(width, height))

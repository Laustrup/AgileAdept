extends Control

@onready var settings: MarginContainer = $MenuSections/Body/MainSection/Main/Settings as MarginContainer
@onready var menu: PanelContainer = $MenuSections/Body/MainSection/Main as PanelContainer

func _ready() -> void:
	navigate(MenuType.NONE)
	
func _on_start_button_pressed() -> void:
	var game_paths = Paths.game_paths
	
	if game_paths.is_empty():
		pass
	
	get_tree().change_scene_to_file(game_paths[randi_range(0, game_paths.size() - 1)])

func _on_settings_button_pressed() -> void:
	navigate(MenuType.NONE if settings.visible else MenuType.SETTINGS)

func _on_close_settings_button_pressed() -> void:
	navigate(MenuType.NONE)

func _on_exit_button_pressed() -> void:
	get_tree().quit(1)

func _on_theme_finished() -> void:
	$Music.play()

func navigate(menuType: MenuType) -> void:
	
	match menuType:
		MenuType.SETTINGS:
			var is_visible = menuType == MenuType.SETTINGS
			menu.visible = is_visible
			settings.visible = is_visible
		MenuType.NONE, _:
			menu.visible = false
			settings.visible = false

enum MenuType {
	SETTINGS,
	NONE
}

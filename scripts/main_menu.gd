extends Control

@onready var landing_page: Panel = $Main/LandingPage as Panel
@onready var settings: Node = $Main/Settings as PanelContainer

func _ready() -> void:
	navigate(MenuType.LandingPage)
	
func _on_start_button_pressed() -> void:
	var game_paths = Paths.game_paths
	
	if game_paths.is_empty():
		pass
	
	get_tree().change_scene_to_file(game_paths[randi_range(0, game_paths.size() - 1)])

func _on_settings_button_pressed() -> void:
	navigate(MenuType.Settings)

func _on_exit_button_pressed() -> void:
	get_tree().quit(1)

func _on_settings_return_button_pressed() -> void:
	navigate(MenuType.LandingPage)

func _on_theme_finished() -> void:
	$Music.play()

func navigate(menuType: MenuType) -> void:
	landing_page.visible = menuType == MenuType.LandingPage
	settings.visible = menuType == MenuType.Settings

enum MenuType {
	LandingPage,
	Settings
}

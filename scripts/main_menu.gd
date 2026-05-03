extends Control

@onready var landing_page: Panel = $LandingPage as Panel
@onready var settings: Node = $SettingsPage as Node
@onready var audioSettings: Panel = $SettingsPage/Configuration/AudioSettings as Panel
@onready var displaySettings: Panel = $SettingsPage/Configuration/DisplaySettings as Panel
@onready var audioSettingsNavigation: CheckBox = $SettingsPage/Navigation/RadioButtons/SettingsAudioRadioButton as CheckBox
@onready var displaySettingsNavigation: CheckBox = $SettingsPage/Navigation/RadioButtons/SettingsDisplayRadioButton as CheckBox

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
	if menuType == MenuType.Settings:
		switch_settings_section()

func _on_settings_audio_radio_button_pressed() -> void:
	switch_settings_section()

func _on_settings_display_radio_button_pressed() -> void:
	switch_settings_section()

func switch_settings_section() -> void:
	audioSettings.visible = audioSettingsNavigation.button_pressed
	displaySettings.visible = displaySettingsNavigation.button_pressed

enum MenuType {
	LandingPage,
	Settings
}

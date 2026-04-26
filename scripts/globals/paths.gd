extends Node

const games_directory = "games/"
var game_paths = []

func _ready() -> void:
	game_paths = get_paths_to_games()

static func get_paths_to_games():
	var directory = DirAccess.open(games_directory)
	if directory == null:
		push_error("Could not open games directory! Will end now...")
		return []
	
	return file_paths_of_directory(directory)


static func file_paths_of_directory(directory: DirAccess):
	var paths = []
	directory.list_dir_begin()
	var file_name = directory.get_next()
	
	while file_name != "":
		if not directory.current_is_dir():
			paths.append(games_directory.path_join(file_name))
		file_name = directory.get_next()
	
	directory.list_dir_end()
	
	return paths

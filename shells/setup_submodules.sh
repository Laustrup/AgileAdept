# This script will set up the system.
# Be aware that it will only work with godot/godot-4 command tools available!
# Also native shell support is required.

_green='\033[0;32m'
_standard_colour='033[0m'

echo "\t${_green}Will initialize submodules${_standard_colour}\n"

git submodule update --init

echo "\t${_green}Will generate api json file${_standard_colour}\n"

godot --dump-extension-api || godot-4 --dump-extension-api || (echo "Failed to dump exention json fail, might be caused by missing godot/godot-4 command tools!" && exit)

mv extension_api.json ../extension_api.json



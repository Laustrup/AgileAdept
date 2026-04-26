_green='\033[0;32m'
_standard_colour='033[0m'
_os=$(uname -s)
_supported_os=("Linux" "Darwin" "WindowsNT")

if [[ "$_os" == "${_supported_os[0]}"]]; then
  _os="linux"
elif [[ "$_os" == "${_supported_os[1]}"]]; then 
  _os="macos"
elif [[ "$_os" == "${_supported_os[2]}"]]; then
  _os="windows"
else
  echo "${_os} is not a valid os, it has to be one of {_supported_os[@]}" && exit

if command -v scons &> /dev/null; then
  echo "SCons is not installed, which is required!" && exit

echo "\t${_green}Discovered allowed os of ${_os}, will now compile scons project${_standard}\n"

(cd ../godot-cpp && scons platform=${_os} custom_api_file=../extension_api.json)

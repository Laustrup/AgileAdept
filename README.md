# Description

This is a game running on the Godot engine with version `4.6.1`.

The whole purpose of the game is basically to be a collection of minigames, that player can compete against each other to earn most points in the shortest amount of time.

Originally I started this project to improve my game dev skills, which would need a lot of different small games to be created, therefore it is all put together in this one game.

# How to set up

## Engine 

Diverse for which OS you are using. The [Official website](https://godotengine.org/download/) will guide you to the download for your OS, but for Ubuntu I actually recommend, even though I usually prefer `apt install`, then in this scenario snap is the easiest approach, which is either in the app center or with command of `sudo snap install godot` or `sudo snap install godot-4`, just be aware, that if godot-4 is installed, then use godot-4 as command.

## Plugins

Many of these instructions are based on Linux Ubuntu OS, but will also mention possible approaches for other systems.

These plugins are not necessary at the moment, since this project is running purely on the standard basic Godot engine, but are created with GDExtension to have it connected to the plugin, so that the engine's feature can be optimized easily through C++.

### GDExtension

This game is using [GDExtension](https://github.com/godotengine/godot-cpp) for some features like C++.

That repo project is a submodule of this project already.

#### Requirements

For this plugin, some requirements are needed:

* C++ compiler

  * Linux
  Already included on most Linux systems, such as GNUs. In case yours aren't, the g++ compiler for c++ can be downloaded by the `sudo apt update && sudo apt install build-essential` or the equavielent for fedoras or alike. The build-essential also include other compilers such as for C.
  pacman could also be smart to use, which is by `sudo pacman -S gcc` and for homebrew it would be `brew install gcc`.

  * MacOS
  If homebrew is installed, then run `brew install gcc`

* SCons

The GDExtension are using the SCons for C++ project building , which is based on Python.

  * Linux

  Simply run `sudo apt-get install scons` for debian based or otherwise the fitting package manager for your distro.
  Can also be done through pacman `pacman -S scons` or hombrew `brew install scons`.

  * MacOS

  Ideal to use with homebrew `brew install scons`.

#### Set up GDExtension

If shell bash is enabled in your env and you are using apt manager, then there is created a script to automate the process at `shells/setup.sh`. It is still experimental though.

In order to set this up, some steps are required:

* Get the extension_api.json

  * Run command: `godot --dump-extension-api` on root level.

    This will generate a json file that we will be using later.

* Generate and compile C++ bindings

  SCons now needs to know how to build the project.
  Go to directory `cd godot-cpp`.
  Now run the command `scons platform=<platform> custom_api_file=extension_api.json` where the <platform> is your os such as windows, linux or macos. In case you have the extension_api.json in a different location or renamed it, the full path and name as to be the correct one.

In case that anything changes through updates or something doesn't fit your setup, please go to the [official documentation](https://docs.godotengine.org/en/4.4/tutorials/scripting/gdextension/gdextension_cpp_example.html) to make it work correctly. The subdirectory part is already included in this project.

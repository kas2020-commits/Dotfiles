#!/bin/sh

# makes directories in advance so that they don't end up as symlinks. This is to
# prevent having other files in the same folder being stored in the repo when
# you don't want that. If you prefer a folder that's symlinked, then use the
# config folder for that.
temp1=$(pwd)
cd "$HOME"/.config
mkdir -p $(ls "$temp1"/config_no_folder_link/.config)
cd "$temp1"

## the actual heavy lifting, curtesey of GNU stow ##
stow -t ~ config config_no_folder_link local

## Home links that need to be made ##
ln -fs "$XDG_CONFIG_HOME"/zprofile 		"$HOME"/.zprofile
ln -fs "$XDG_CONFIG_HOME"/xinitrc  		"$HOME"/.xinitrc
ln -fs "$XDG_CONFIG_HOME"/task/taskrc  	"$HOME"/.taskrc

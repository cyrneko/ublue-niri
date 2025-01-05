#!/usr/bin/env bash

# blatantly stolen because I could not be bothered to write
# boilerplate that I last wrote years ago
function yesno {
    while true; do
        read -p "$* [y/n]: " yn
        case $yn in
            [Yy]*) return 0  ;;  
            [Nn]*) echo "Script Aborted." ; return  1 ;;
        esac
    done
}

subfolders=("niri" "fuzzel" "foot" "swaync")

function reverse() {
	for subfolder in "${subfolders[@]}"; do
		cp -r "$HOME/.config/-backups/$subfolder" "$HOME/.config/"
		echo "restored $subfolder configurations"
	done
}

function system-configs() {
	echo "This will backup your user configuration and switch to the system-provided configuration instead."
	echo "This also involves logging you out to prevent (inevitable) breakage and a fresh start."
	# good idea to run `exit` from a script? no.
	# can I be bothered? no
	yesno "do you wish to continue?" && echo "alright" || exit 1;

	mkdir -p "$HOME/.config/-backups"
	for subfolder in "${subfolders[@]}"; do
		# echo "$HOME/.config/$subfolder"
		cp -r "$HOME/.config/$subfolder" "$HOME/.config/-backups/"
		echo "backed up $subfolder configuration to '$HOME/.config/-backups'"
		rm -rf "$HOME/.config/$subfolder"
		echo "removed $subfolder user-configurations"
	done
	echo "logging out all sessions for $USER in 3 sec..."
	sleep 3s
	echo "$USER"
	# loginctl terminate-user "$USER"
}

function help() {
	echo "Commands:"
	echo "  system - switches to the system-provided config"
	echo "  revert - switches back to your user-config backup"
}

case $@ in
	system)
		system-configs;;
	revert)
		reverse;;
	help)
		help;;
	*)
		echo "$0 $1 is not a valid command."
		echo ""
		help;;
esac


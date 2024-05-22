#!/bin/bash


green_color="\e[0;32m"
end_color="\e[0m"
red_color="\e[0;31m"
blue_color="\e[0;34m"
yellow_color="\e[0;33m"
purple_color="\e[0;35m"
cyan_color="\e[0;36m"
gray_color="\e[0;37m"

# Description: handle the Ctrl+C signal and exit the program.
# Parameters: none.
function ctrl_c() {
	echo -e "${red_color}[-]${end_color}Exiting...\n"
	tput cnorm
	exit 1
}

trap ctrl_c INT

# ---------------------------------------------------------------------------- #

# Description: displays the help panel with usage instructions for the script.
# Parameters: none.
function help_panel() {
	echo -e "${green_color}[+]${end_color} Usage:\n"

	for ((i=0; i<${#files[@]}; i++)); do
		echo -e "${green_color}$i${end_color}) File: ${files[i]} Target: ${target_paths[i]}"
	done

	echo -e "$\t${purple_color}-i${end_color} <number of a application> <number of a application>*"
	echo -e "$\t${purple_color}-h${end_color} display this panel\n"
}

# Description: validates if the given option is a number.
# Parameters: none.
function validate_option() {
	option=$1
	if [[ ! $option =~ ^[0-9]+$ ]]; then
		echo -e "${red_color}[-]${end_color} Error: invalid option"
		exit 1
	fi
}

dotfiles_path="$(dirname -- "${BASH_SOURCE[0]}")"
dotfiles_path="$(cd -- "$dotfiles_path" && pwd)"

if [[ ! "$dotfiles_path" ]] ; then
	exit 1
fi

declare -r files=(
	"bspwm"
	"firefox"
	"bin"
	"sxhkd"
	"kitty"
	"bashrc"
	"bash_utilities"
	"bash_profile"
	"nvim"
	"polybar"
	"qt5ct"
	"rofi"
	"xcfe4"
)

declare -r target_paths=(
	"$dotfiles_path/bspwm"
	"$dotfiles_path/firefox"
	"$dotfiles_path/scripts"
	"$dotfiles_path/sxhkd"
	"$dotfiles_path/kitty"
	"$dotfiles_path/bash/.bashrc"
	"$dotfiles_path/bash/.bash_utilities"
	"$dotfiles_path/bash/.bash_profile"
	"$dotfiles_path/nvim"
	"$dotfiles_path/polybar"
	"$dotfiles_path/qt5ct/everything_i_see_is_gray.conf"
	"$dotfiles_path/rofi"
	"$dotfiles_path/xfce4"

)

declare -r link_paths=(
	".config/bspwm"
	".mozilla/firefox"
	".local/bin"
	".config/sxhkd"
	".config/"
	""
	""
	""
	".config/nvim"
	".config/polybar"
	".config/qt5ct/colors"
	".config/rofi"
	".config/xfce4/xfconf/xfce-perchannel-xml"
)

# Description: applies dotfiles by creating symbolic links from target paths to link paths.
# Parameters:
# 	- $@: The indices of the dotfiles to apply.
function apply_dotfiles() {
	for file_index in "$@"; do
		validate_option $file_index
		echo -e "${blue_color}${target_paths[$file_index]}${end_color} -> ${blue_color}$HOME/${link_paths[$file_index]}${end_color}"
		ln -fs "${target_paths[$file_index]}" "$HOME/${link_paths[$file_index]}"
	done
}

# ---------------------------------------------------------------------------- #

while getopts "i" arg; do
	case $arg in
		i)
			shift 1
			apply_dotfiles "$@"
			;;
		*) help_panel;;
	esac
done

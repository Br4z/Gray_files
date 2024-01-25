dotfiles_path="$(dirname -- "${BASH_SOURCE[0]}")"
dotfiles_path="$(cd -- "$dotfiles_path" && pwd)"
if [[ -z "$dotfiles_path" ]] ; then
	exit 1
fi

# ln -fs "$dotfiles_path/bspwm" "$HOME/.config/bspwm"
# ln -fs "$dotfiles_path/firefox" "$HOME/.mozilla/firefox"
# ln -fs "$dotfiles_path/scripts" "$HOME/.local/bin"
# ln -fs "$dotfiles_path/sxhkd" "$HOME/.config/sxhkd"
# ln -fs "$dotfiles_path/kitty" "$HOME/.config/"
# ln -fs "$dotfiles_path/bash/.bashrc" "$HOME"
# ln -fs "$dotfiles_path/bash/.bash_aliases" "$HOME"
# ln -fs "$dotfiles_path/bash/.bash_profile" "$HOME"
# ln -fs "$dotfiles_path/nvim" "$HOME/.config/nvim"
# ln -fs "$dotfiles_path/polybar" "$HOME/.config/polybar"
# ln -fs "$dotfiles_path/qt5ct/everything_i_see_is_gray.conf" "$HOME/.config/qt5ct/colors"
# ln -fs "$dotfiles_path/rofi" "$HOME/.config/rofi"
# ln -fs "$dotfiles_path/xfce4" "$HOME/.config/xfce4/xfconf/xfce-perchannel-xml"

#!/bin/bash
#  ______   ______   ______   __  __   ______   ______
# /\  == \ /\  __ \ /\  ___\ /\ \_\ \ /\  == \ /\  ___\
# \ \  __< \ \  __ \\ \___  \\ \  __ \\ \  __< \ \ \____
#  \ \_____\\ \_\ \_\\/\_____\\ \_\ \_\\ \_\ \_\\ \_____\
#   \/_____/ \/_/\/_/ \/_____/ \/_/\/_/ \/_/ /_/ \/_____/


# ---------------------------------------------------------------------------- #
#                                 SOURCE FILES                                 #
# ---------------------------------------------------------------------------- #

if [ -f "$HOME/.bash_utilities" ]; then
	source "$HOME/.bash_utilities"
fi


# ---------------------------------------------------------------------------- #
#                                    PROMPT                                    #
# ---------------------------------------------------------------------------- #

if which oh-my-posh &>/dev/null; then
	theme_path=""

	if [ "$POSH_THEMES_PATH" ]; then
		theme_path="$POSH_THEMES_PATH/kali.omp.json"
	else
		theme_path="$HOME/.oh_my_posh-theme.json"
	fi

	eval "$(oh-my-posh init bash --config "$theme_path")"
fi

[[ $- != *i* ]] && return # Exit if the current shell is not interactive

# Change the window title of X terminals
case ${TERM} in
	kitty)
		PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"';;
	screen*)
		PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"';;
esac

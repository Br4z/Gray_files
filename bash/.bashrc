#  ______   ______   ______   __  __   ______   ______
# /\  == \ /\  __ \ /\  ___\ /\ \_\ \ /\  == \ /\  ___\
# \ \  __< \ \  __ \\ \___  \\ \  __ \\ \  __< \ \ \____
#  \ \_____\\ \_\ \_\\/\_____\\ \_\ \_\\ \_\ \_\\ \_____\
#   \/_____/ \/_/\/_/ \/_____/ \/_/\/_/ \/_/ /_/ \/_____/

# source /usr/share/nvm/init-nvm.sh
# export PATH=$PATH:/home/braz/.spicetify

# ---------------------------------------------------------------------------- #
#                                 SOURCE FILES                                 #
# ---------------------------------------------------------------------------- #

if [ -f ~/.bash_utilities ]; then
	. ~/.bash_utilities
fi

if [ -f ~/.bash_profile ]; then
	. ~/.bash_profile
fi

# ---------------------------------------------------------------------------- #
#                                    PROMPT                                    #
# ---------------------------------------------------------------------------- #

force_color_prompt=yes

function parse_git_dirty {
	[[ $(git status --porcelain 2> /dev/null) ]] && echo "*"
}
function parse_git_branch {
	git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/ (\1$(parse_git_dirty))/"
}

export PS1="\n\t 󰣇 \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

[[ $- != *i* ]] && return

# Change the window title of X terminals
case ${TERM} in
	kitty)
		PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"'
		;;
	screen*)
		PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"'
		;;
esac

# Because zsh only read z_profile
source $HOME/.profile

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Basics
DEFAULT_USER=niid

if [[ $DOTFILES_OS = "WSL" ]]; then
    PROJECT_PATHS=(
        /mnt/c/Users/niid/Documents/Projects
        /mnt/c/Develop/projects
    )
elif [[ $DOTFILES_OS == "osx" ]]; then
    PROJECT_PATHS=(
        $HOME/Documents/Projects
    )
    test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
fi

#HELPDIR=/usr/local/share/zsh/help
#fpath=(/usr/local/share/zsh-completions $fpath)

ZSH_THEME=agnoster
# BASE16_SHELL="$DOTFILES/colors/base16-ocean.dark.sh"
# [[ -s $BASE16_SHELL ]] && . $BASE16_SHELL

DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="yyyy-mm-dd"

plugins=(
    colored-man-pages
    colorize
    git
#    git-aliases
    pip
    pj
    python
    sudo
    virtualenv
    web-search
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

[ -r "$DOTFILES/z_aliases" ] && source "$DOTFILES/z_aliases"


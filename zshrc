# First things first
source $HOME/.profile

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Basics
DEFAULT_USER=niid

PROJECT_PATHS=(
    $HOME/Projects
)

HELPDIR=/usr/local/share/zsh/help
fpath=(/User/local/share/zsh-completions $fpath)

# Theme
ZSH_THEME=agnoster
BASE16_SHELL="$DOTFILES/colors/base16-ocean.dark.sh"
[[ -s $BASE16_SHELL ]] && . $BASE16_SHELL

# Settings
# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you wantto change the command execution time
# stamp down in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Plugins
plugins=(
    colored-man-pages
    colorize
    git
    git-aliases
    pip
    pj
    python
    sudo
    virtualenv
    web-search
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# Aliases
[ -r "$DOTFILES/aliases" ] && source "$DOTFILES/aliases"
[ -r "$DOTFILES/aliases_proxy" ] && source "$DOTFILES/aliases_proxy"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

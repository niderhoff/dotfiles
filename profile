export DOTFILES=$HOME/.dotfiles

# check for WSL
SYS_KERNEL=/proc/sys/kernel/osrelease
if [[ -a $SYS_KERNEL && "$(< $SYS_KERNEL)" == *Microsoft ]]; then
    export DOTFILES_OS="WSL"
elif [[ "$(uname)" == "Darwin" ]]; then
    export DOTFILES_OS="osx"
    source $DOTFILES/colors/base16-ocean.dark.sh
elif [[ "$(expr substr $(uname -s) 1 5)" == "Linux" ]]; then
    export DOTFILES_OS="linux"
elif [[ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]]; then
    export DOTFILES_OS="windows"
fi

# ----------- PATH -------------
# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.bin" ] ; then
    export PATH="$HOME/.bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    export PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "/usr/local/go" ]; then
    export PATH="$PATH:/usr/local/go/bin"
fi

if [ -d "$HOME/.cargo/bin" ]; then
    export PATH="$HOME/.cargo/bin:$PATH"
fi

export DOTNET_ROOT="$HOME/.dotnet"
export PATH="$DOTNET_ROOT:$PATH"

# ---------- ALIASES ----------
# some default aliases
[ -r "$HOME/.aliases" ] && source "$HOME/.aliases"

# ---------- ENVIRONMENT -------
# proxy switch scripts
if [ -f "$HOME/.proxy" ]; then
    source $HOME/.proxy
fi

export NNN_USE_EDITOR=1
export PAGER=less

if [[ $DOTFILES_OS == "WSL" || $DOTFILES_OS == "linux" ]]; then
    LS_COLORS="ow=01;36;40" && export LS_COLORS
fi

if [[ $DOTFILES_OS == "osx" ]]; then
    export LC_ALL=en_US.UTF-8
    export LANG=en_US.UTF-8
fi

# ----------- CUDA -------------
# export CUDAVER=7.5
# export PATH=$CUDABIN:$PATH
# export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib:/usr/local/cuda/lib64
# export CUDA_ROOT=/usr/local/cuda
# export CUDABIN="/usr/local/cuda-$CUDAVER/bin"

# ---------- SSH ---------------
# export SSH_KEY_PATH="~/.ssh/dsa_id"
# if [[ -n $SSH_CONNECTION ]]; then
if [ -n "$SSH_CLIENT" ]; then
    PS1="(ssh) $PS1"
    export EDITOR='vim'
    export VISUAL="$EDITOR"
else
    PS1=$PS1
    export EDITOR='nvim'
    export VISUAL="$EDITOR"
fi

# ---------- WELCOME MSG --------
#if [ -f /var/lib/apt/periodic/update-success-stamp ]; then
#    LASTAPT=$(ls -l /var/lib/apt/periodic/update-success-stamp | awk '{print $5" "$6" "$7}')
#    echo "The last apt-update was: $LASTAPT"
#fi
#if [ -f $DOTFILES/lastupdate ]; then
#    LASTUPDATE=$(cat $DOTFILES/lastupdate | sed -n 1p)
#fi

TODO_FILE="$HOME/.todo/todo.txt"
if [ -f $TODO_FILE ]; then
    NUMTODO=$(cat $TODO_FILE | wc -l)
    echo "You have $NUMTODO tasks to do!"
fi

# ---------- BASH -------------
# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# ----------- NVM -------------
export NVM_LAZY_LOAD=true
if [[ $DOTFILES_OS == "osx" ]]; then
    source $(brew --prefix nvm)/nvm.sh
else
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi

# ----------- PYENV -----------
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
  pyenv virtualenvwrapper
  export PROJECT_HOME="$HOME/projects"
fi


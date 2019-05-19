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
    PATH="$HOME/.bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# ---------- ALIASES ----------
# some default aliases
[ -r "./aliases" ] && source "./aliases"

# ---------- ENVIRONMENT -------
# proxy switch scripts
if [ -f "$HOME/.proxy" ]; then
    source $HOME/.proxy
fi

export NNN_USE_EDITOR=1
export PAGER=less

if [[ $DOTFILES_OS == "osx" ]]; then
    export LC_ALL=en_US.UTF-8
    export LANG=en_US.UTF-8
fi

# ----------- PYTHON -----------
# export PYVERSION=3
# export CONDA_BIN="$HOME/miniconda"$PYVERSION"/bin"
# if [-d "$CONDA_BIN/bin" ]; then
#     PATH="$CONDA_BIN/bin:$PATH"
# fi

# ----------- CUDA -------------
# export CUDAVER=7.5
# export PATH=$CUDABIN:$PATH
# export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib:/usr/local/cuda/lib64
# export CUDA_ROOT=/usr/local/cuda
# export CUDABIN="/usr/local/cuda-$CUDAVER/bin"

# ----------- NVM --------------
# export NVM_DIR=$HOME/.nvm
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "NVM_DIR/bash_completion" # 

# ---------- SSH ---------------
# export SSH_KEY_PATH="~/.ssh/dsa_id"
# if [[ -n $SSH_CONNECTION ]]; then
if [ -n "$SSH_CLIENT" ]; then
    PS1="(ssh) $PS1"
    export EDITOR='vim'
else
    PS1=$PS1
    export EDITOR='vim'
fi

# ---------- WELCOME MSG --------
if [ -f /var/lib/apt/periodic/update-success-stamp ]; then
    LASTAPT=$(ls -l /var/lib/apt/periodic/update-success-stamp | awk '{print $5" "$6" "$7}')
    echo "The last apt-update was: $LASTAPT"
fi
if [ -f $DOTFILES/lastupdate ]; then
    LASTUPDATE=$(cat $DOTFILES/lastupdate | sed -n 1p)
fi

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


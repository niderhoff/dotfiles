export DOTFILES="$HOME/.dotfiles"

# check for WSL
if [[ "$(< /proc/sys/kernel/osrelease)" == *Microsoft ]]; then
    export DOTFILES_OS="WSL"
fi

# PYTHON
# export PYVERSION=3
# export CONDABIN="$HOME/miniconda"$PYVERSION"/bin"
# if [-d "$CONDABIN/bin" ]; then
#     PATH="$CONDABIN/bin:$PATH"
# fi

# CUDA
# export CUDAVER=7.5
# export PATH=$CUDABIN:$PATH
# export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib:/usr/local/cuda/lib64
# export CUDA_ROOT=/usr/local/cuda
# export CUDABIN="/usr/local/cuda-$CUDAVER/bin"

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.bin" ] ; then
    PATH="$HOME/.bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# some default aliases
[ -r ".aliases" ] && source ".aliases"

# proxy switch scripts
if [ -d $HOME/.proxy ]; then
    source $HOME/.proxy
fi

# SSH
# export SSH_KEY_PATH="~/.ssh/dsa_id"
if [ -n "$SSH_CLIENT" ]; then
    PS1="(ssh) $PS1"
else
    PS1=$PS1
fi
# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#     export EDITOR='vim'
# else
#     export EDITOR='vim'
# fi

LASTAPT=$(ls -l /var/lib/apt/periodic/update-success-stamp | awk '{print $5" "$6" "$7}')
#LASTUPDATE=$(cat $DOTFILES/lastupdate | sed -n 1p)
TODO_FILE="$HOME/.todo/todo.txt"
if [ -z $TODO_FILE ]; then
    NUMTODO=$(cat $TODO_FILE | wc -l)
fi
echo "The last apt-update was: $LASTAPT"
echo "You have $NUMTODO tasks to do!"

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# NVM
export NVM_DIR=$HOME/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "NVM_DIR/bash_completion" # 

# dotfiles
export DOTFILES="$HOME/.dotfiles"

# anacondaversion
export PYVERSION=2
export CONDABIN="$HOME/anaconda"$PYVERSION"/bin"

# PATH
export PATH=/usr/local/cuda-7.5/bin:$PATH

if [ -d "$HOME/.local/bin" ]; then
    PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$CONDABIN/bin" ]; then
    PATH="$CONDABIN/bin:$PATH"
fi

if [ -d "$HOME/.bin" ]; then
    PATH="$HOME/.bin:$PATH"
fi

# proxy switch scripts
source $DOTFILES/proxy
source $DOTFILES/profile_proxy

# Environment
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib:/usr/local/cuda/lib64
export CUDA_ROOT=/usr/local/cuda

# SSH
# export SSH_KEY_PAT="~/.ssh/dsa_id"
if [ -n "$SSH_CLIENT" ]; then
    PS1="(ssh) "$PS1
else
    PS1=$PS1
fi

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
    export EDITOR='vim'
fi

# color support
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some default aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Greeting
LASTAPT=$(ls -l /var/lib/apt/periodic/update-success-stamp | awk '{print $6" "$7" "$8}')
LASTUPDATE=$(cat $DOTFILES/lastupdate | sed -n 1p)
NUMTODO=$(cat $HOME/.todo/todo.txt | wc -l)
echo "The last small update was: $LASTAPT"
echo "The last big update was: $LASTUPDATE"
echo "You have $NUMTODO tasks to do!"

 # if running bash
 if [ -n "$BASH_VERSION" ] ; then
     # include .bashrc if exists
     if [ -f "$HOME/.bashrc" ] ; then
         . "$HOME/.bashrc"
     fi
 fi

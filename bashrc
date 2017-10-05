 # If running on WSL, start zsh manually
 if grep -q Microsoft /proc/version; then
     exec zsh
 fi

 if [ -f ~/.bash_aliases ]; then
     . ~/.bash_aliases
 fi


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

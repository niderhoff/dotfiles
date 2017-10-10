#!/bin/bash

set -e
cd "$(dirname "$0")"

if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "   Installing Oh My ZShell!"
    git clone https://github.com/robbyrussell/oh-my-zsh ~/.oh-my-zsh
fi

if [ ! $SHELL == "/usr/local/bin/zsh" ]; then 
    if ! cat /etc/shells | grep "/usr/local/bin/zsh"; then
        sudo cat /etc/shells >> /usr/local/bin/zsh
    fi
    echo "   Changing default shell"
    sudo dscl . change /users/$USER UserShell /bin/bash $(which zsh)
fi

echo "   Fixing Shell Colors"
sh $HOME/.dotfiles/colors/base16-ocean.dark.sh

#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

if [ "$1" == "" ] || [ $# -gt 1 ]; then
    echo "Parameter 1 is empty"
    exit 1
fi

if [ ! $DOTFILES ]; then
    echo "\$DOTFILES is not set."
    exit 1
else
    echo "DOTFILES Path: $DOTFILES"
fi

if [ ! $PIP_BIN ]; then
    PIP_BIN=/usr/bin/pip3
    echo "\$PIP_BIN is not set, defaulting to: $PIP_BIN"
else
    echo "PIP_BIN: $PIP_BIN"
fi

if [ "$1" == "wsl" ]; then
    if [[ -f ../proxy ]]; then
        echo "Loading Proxy Settings..."
        source $DOTFILES/proxy
        ln -s $DOTFILES/proxy $HOME/.proxy
    fi
    source $DOTFILES/setup/install-wsl.sh
    source $DOTFILES/setup/bootstrap.sh
    cd $DIR
    source $DOTFILES/setup/install-pip.sh
elif [ "$1" == "linux" ]; then
    source $DOTFILES/setup/bootstrap.sh
    cd $DIR
    source $DOTFILES/setup/install-pip.sh
else
    echo "Command unknown: $1..."
    exit 1
fi

echo "Running post-install..."

sed -i "s|<dotfiles>|$DOTFILES|g" $DOTFILES/profile

if [ $INSTALL_ZSH ]; then
    source $HOME/.zshrc
    echo "Reloaded .zshrc..."
else
    # clear screen
    # echo -en "\ec"
    source $HOME/.bash_profile
    source $HOME/.bashrc
fi

source $DOTFILES/setup/install-gi.sh

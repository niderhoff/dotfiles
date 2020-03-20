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
    GITGLOBAL=(JupyterNotebooks Linux Vim)
    if [[ -f ../proxy && ! -f $HOME/.proxy ]]; then
        echo "Loading Proxy Settings..."
        . $DOTFILES/proxy
        ln -s $DOTFILES/proxy $HOME/.proxy
    fi

    echo "Installing WSL specific config..."
    #ln -s /mnt/c/Users/niid/.gitconfig $HOME/.gitconfig
    if [ ! -e $HOME/.gitconfig ]; then
        echo "copying bootstrap gitconfig..."
        cp $DOTFILES/setup/resources/gitconfig_wsl $HOME/.gitconfig
    fi
    echo "linking vimrc from windows..."
    if [ ! -d $HOME/.vim ]; then
        ln -s /mnt/c/Users/niid/.vim $HOME/.vim
    fi
    ! test -e $HOME/.vimrc && ! test -L $HOME/.vimrc && ln -s /mnt/c/Users/niid/.vim/vimrc $HOME/.vimrc
    #if [ ! -e $HOME/.vimrc ] || [ -L $HOME/.vimrc ]; then
    #    ln -s /mnt/c/Users/niid/.vim/vimrc $HOME/.vimrc
    #fi

    cd $DIR
    . $DOTFILES/setup/install-pip.sh
elif [ "$1" == "linux" ]; then
    GITGLOBAL=(JupyterNotebooks Linux Vim)
    cd $DIR
    . $DOTFILES/setup/install-pip.sh
else
    echo "Command unknown: $1..."
    exit 1
fi

if [ -z "$GITGLOBAL" ]; then
    echo "Setting gitignore_global"
    function joinString { local IFS="$1", shift; echo "$*"; }
    function gi { curl -L -s https://www.gitignore.io/api/"$*"; }

    gi $(joinString , ${GITGLOBAL[@]}) > $DOTFILES/gitignore_global
fi
if [[ -f custom_gitignore.txt ]]; then
    cat custom_gitignore.txt >> $DOTFILES/gitignore_global
fi



if [ ! $PIP_BIN ]; then
    echo "ERROR: NO PIP_PATH set."
    exit 1
fi

if [ ! $DOTFILES ]; then
    echo "ERROR: NO DOTFILES PATH set."
    exit 1
fi

$PIP_BIN install --user dotfiles
cd $HOME
! test -e $HOME/.dotfilesrc && ln -s $DOTFILES/dotfilesrc $HOME/.dotfilesrc
dotfiles --sync

echo "Running post-install..."

sed -i "s|<dotfiles>|$DOTFILES|g" $DOTFILES/profile

if [ $INSTALL_ZSH ]; then
    . $HOME/.zshrc
    echo "Reloaded .zshrc..."
else
    # clear screen
    # echo -en "\ec"
    . $HOME/.bash_profile
    . $HOME/.bashrc
fi

read -p "Enter Name for Git commits: " gitname
read -p "Enter Mail for Git commits: " gitmail
git config --global user.name "$gitname"
git config --global user.email "$gitmail"
echo "Done..."

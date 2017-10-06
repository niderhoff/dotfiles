#!/bin/sh
cd $HOME

$CONDABIN/dotfiles --sync

if [ ! -f $HOME/.vimrc ]; then
    ln -s ~/.dotfiles/vim/vimrc ~/.vimrc
fi

if [ ! -f $HOME/.gvimrc ]; then
    ln -s ~/.dotfiles/vim/gvimrc ~/.gvimrc
fi

ln -s $CONDABIN/conda $HOME/.bin/conda
ln -s $CONDABIN/activate $HOME/.bin/activate
ln -s $CONDABIN/deactivate $HOME/.bin/deactivate

#!/bin/sh
cd $HOME

$HOME/anaconda2/bin/dotfiles --sync

if [ ! -f $HOME/.vimrc ]; then
    ln -s ~/.dotfiles/vim/vimrc ~/.vimrc
fi

if [ ! -f $HOME/.gvimrc ]; then
    ln -s ~/.dotfiles/vim/gvimrc ~/.gvimrc
fi

ln -s $HOME/anaconda2/bin/conda $HOME/.bin/conda
ln -s $HOME/anaconda2/bin/activate $HOME/.bin/activate
ln -s $HOME/anaconda2/bin/deactivate $HOME/.bin/deactivate

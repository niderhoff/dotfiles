#!/bin/sh
cd $HOME

if [ ! -f $HOME/.vimrc ]; then
    ln -s ~/.dotfiles/vim/vimrc $DOTFILES/vimrc
fi

if [ ! -f $HOME/.gvimrc ]; then
    ln -s ~/.dotfiles/vim/gvimrc $DOTFILES/gvimrc
fi

ln -s $CONDABIN/conda $DOTFILES/bin/conda
ln -s $CONDABIN/activate $DOTFILES/bin/activate
ln -s $CONDABIN/deactivate $DOTFILES/bin/deactivate

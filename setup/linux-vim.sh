#!/bin/sh
#
# vim setup
#

set -e
URL="http://github.com/niderhoff/linux.dotfiles.vim"
VIMDIR="$HOME/.dotfiles/vim"


cd "$(dirname "$0")"

# check for anaconda

if [ ! -d "$VIMDIR" ]; then
    git clone $URL $VIMDIR
    cd $VIMDIR
    ln -s $VIMDIR/vimrc $HOME/.dotfiles/vimrc
    ln -s $VIMDIR/vimrc $HOME/.dotfiles/gvimrc
    git submodule init
    git submodule update
    cd $HOME
    dotfiles --sync
else
    echo "    $VIMDIR already exists."
fi

echo "   Done."


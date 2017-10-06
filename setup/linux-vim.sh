#!/bin/sh
#
# vim setup
#

set -e
URL="http://github.com/niderhoff/linux.dotfiles.vim"
VIMDIR="$HOME/.dotfiles/vim"


cd "$(dirname "$0")"

if [ ! -d "$VIMDIR" ]; then
    echo "    Pulling all VIM submodules."
    cd $VIMDIR
    git submodule init
    git submodule update
fi

echo "   Done."


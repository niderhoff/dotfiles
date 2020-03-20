#!/bin/sh

set -e

cd "$(dirname "$0")"

GLOBAL=(IPythonNotebook OSX Vim)

function joinString { local IFS="$1", shift; echo "$*"; }


function gi { curl -L -s https://www.gitignore.io/api/"$*"; }


gi $(joinString , ${GLOBAL[@]}) > $DOTFILES/gitignore_global

if [[ -f custom_gitignore.txt ]]; then
    cat custom_gitignore.txt >> $DOTFILES/gitignore_global
fi

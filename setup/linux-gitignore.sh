#!/bin//sh

set -e

cd "$(dirname "$0")"

function joinString { local IFS="$1"; shift; echo "$*"; }
function gi() { curl -L -s https://www.gitignore.io/api/"$@" ;}


GLOBAL=(
    IPythonNotebook
    Vim
#   Matlab
    Linux
#   Dropbox
)

gi $(joinString , ${GLOBAL[@]}) > $HOME/.dotfiles/gitignore_global
if [[ -f custom_gitignore.txt ]]; then
    cat custom_gitignore.txt >> $HOME/.dotfiles/gitignore_global
fi

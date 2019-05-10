# linux.dotfiles

## Preqrequisites

-   pip
-   git
-   Working internet connection

## Installation

    $ export PIP_BIN=<path_to_your_pip_installation>
    $ export DOTFILES=$HOME/.dotfiles
    $ git clone https://github.com/niderhoff/linux.dotfiles.git $DOTFILES
    $ bash ~/.dotfiles/setup/install.sh <platform>

where platform is one of: `linux`, `wsl`.

## TODO

- bootstrap pip version should be 
- Automatically source proxy before bootstrap
- merge osx stuff
- add new vimrc

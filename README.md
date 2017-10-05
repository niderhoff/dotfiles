# linux.dotfiles

## Preqrequisites

    $ pip install dotfiles

## Installation

    $ cd
    $ git clone https://github.com/niderhoff/linux.dotfiles.git ~/.dotfiles
    $ cd ~/.dotfiles
    $ sudo make linux

## TODO

*   Make sure that $pyversion is exported to a global variable that is read over
    .profile so all anaconda paths are dynamic to the python version.
*   Make sure when using the setup that the following order will be executed:
    git clone > symlink important stuff from .dotfiles > execute setup > dotfiles --sync
*   Merge with OSX dotfiles
*   Add VIM submodule
*   Add ATOM submodule
*   Make sure proxy settings are set BEFORE anything else during setup process.

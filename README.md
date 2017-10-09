# linux.dotfiles

## Preqrequisites

You need:

*   Git
*   Working internet connection

Put the following lines into "~/.dotfilesrc"

    [dotfiles]
    repository = ~/Dotfiles
    ignore = [
        '.git',
        '.gitignore',
        '*.swp']
    
Then do:

    $ pip install dotfiles

## Actual Installation

    $ cd
    $ git clone https://github.com/niderhoff/linux.dotfiles.git ~/.dotfiles
    $ cd ~/.dotfiles
    $ sudo make linux

## TODO

*   FATAL ERROR:
    *   if you just install the dotfiles and do not have zsh installed, you are dead-locked out of your system.
*   Minor Errors:
    *   ~/.dotfiles/profile is not sourced automatically so some importat vars for the setup scripts are missing.
        we want to be able to install without having to exit and re-enter bash manually.
    *   no such file: proxy/profile_proxy/lastupdate/todo.txt
    *   generic.sh and platform.sh are not working properly.
*   Finish setup:
    *   Add extra routine that can install system-proxy for you so git is working.
    *   make sure all is working
    *   add option to automatically pull submodules recursively.
    *   add zsh installation
    *   fix gitignore-global.sh
    *   make sure execution order is correct
*   add dynamic gitconfig script
*   make sure weird windows zsh startup thing
    a.  does not inferere with regular ubuntu zsh start
    b.  is only executed if windows is actual host
*   Merge with OSX dotfiles
    *   wallpapers
    *   osx-specific stuff
    *   osx-setupscripts
*   Add ATOM submodule
*   Make sure proxy settings are set BEFORE anything else during setup process.

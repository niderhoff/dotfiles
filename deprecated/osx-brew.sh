#!/bin/sh
#
# Homebrew
#
# This installs some of the common dependencies needed (or at least desired)
# using Homebrew.
#
# taken from: https://github.com/mrrej89/dotfiles

set -e

# Check for Homebrew
if test ! $(which brew)
then
  echo "  Installing Homebrew for you."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

cd "$(dirname "$0")"

TAPS=(
    caskroom/versions
    caskroom/cask
    caskroom/fonts
    homebrew/science
)

FORMULAS=(
    go
    htop
    mpd
    ncmpcpp
    node
    openssl
    p7zip
    pandoc
    pkg-config
    pstree
    r
    screenfetch
    slurm
    sqlite
    tmux
    tree
    unrar
    vim
    wget
    zeromq
    zsh
    zsh-completions
)

FONTS=(	
    font-hack
    font-source-code-pro
)

CASKS=(
    disk-inventory-x
    dropbox
    flux
    quicklook-csv
    quicklook-json
    qlmarkdown
    spectacle
    xquartz
)

for tap in ${TAPS[@]}
do
    brew tap $tap
done

brew install ${FORMULAS[@]}

brew update

brew cask install --appdir="/Applications" ${CASKS[@]}

brew cask install ${FONTS[@]}

#brew install vim --with-override-system-vi --with-lua --HEAD

#brew linkapps macvim

brew cleanup

brew cask cleanup

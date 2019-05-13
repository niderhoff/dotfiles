#!/bin/sh
#
# Anaconda setup
#
# This should install anaconda and set up the basic stuff
#
# inspired by: https://github.com/mrrej89/dotfiles

set -e

# 2 = python2.7, 3 = python3
pyversion=2
url="http://repo.continuum.io/archive/Anaconda"$pyversion"-4.1.1-MacOSX-x86_64.sh"

cd "$(dirname "$0")"

# Check for anaconda2
if [[ ! -f $HOME/anaconda$pyversion/bin/conda ]]
then
    if [ ! -e $(basename "$url") ]
    then
        echo "   Trying to install "$(basename "$url" .sh)" for you."
        curl -O $url
    else echo "Skipping $url because file already exists"
    fi
    bash $(basename "$url")
fi

PACKAGES=(
    flake8
    pydot-ng
    pylint
)

PIP=(
    dotfiles
    keras
)

echo "   Updating Conda"

$HOME/anaconda$pyversion/bin/conda update conda
$HOME/anaconda$pyversion/bin/conda update --all

echo "   Installing custom packages"

for package in ${PACKAGES[@]}
do
    $HOME/anaconda$pyversion/bin/conda install $package
done

echo "   Installing unavailable packages over pip"

for pip in ${PIP[@]}
do
    $HOME/anaconda$pyversion/bin/pip install $package
done

echo "   Done."

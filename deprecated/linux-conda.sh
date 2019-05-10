#!/bin/sh
#
# Anaconda setup
#
# This should install anaconda and set up basic stuff
#

set -e
url="https://repo.continuum.io/archive/Anaconda"$PYVERSION"-4.4.0-Linux-x86_64.sh"

cd $HOME

# check for anaconda
if [[ ! -f $CONDABIN/conda ]]; then
    if [ ! -e $(basename "$url") ]; then
        echo "    Trying to install "$(basename "$url" .sh)" for you."
        curl -O $url
    else echo "Skipping $url because file already exists"
    fi
    bash $(basename "$url")
fi

PACKAGES=()
PIP=(
    dotfiles
    keras
)

echo "    Updating conda"

$CONDABIN/conda update conda
# $CONDABIN/conda update --all

echo "    Installing custom packages"

for package in ${PACKAGES[@]}
do
    $CONDABIN/conda install $package
done

echo "    Installing unavailable packages over pip"

for pip in ${PIP[@]}
do
    $CONDABIN/pip install $package
done

echo "   Done."


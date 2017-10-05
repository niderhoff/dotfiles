#!/bin/sh
#
# Anaconda setup
#
# This should install anaconda and set up basic stuff
#

set -e
# 2 = python2.7, 3 = python3.5
pyversion=3
url="https://repo.continuum.io/archive/Anaconda"$pyversion"-5.0.0.1-Linux-x86_64.sh"

cd "$(dirname "$0")"

# check for anaconda
if [[ ! -f $HOME/anaconda$pyversion/bin/conda ]]; then
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

$HOME/anaconda$pyversion/bin/conda update conda
$HOME/anaconda$pyversion/bin/conda update --all

echo "    Installing custom packages"

for package in ${PACKAGES[@]}
do
    $HOME/anaconda$pyversion/bin/conda install $package
done

echo "    Installing unavailable packages over pip"

for pip in ${PIP[@]}
do
    $HOME/anaconda$pyversion/bin/pip install $package
done

echo "   Done."


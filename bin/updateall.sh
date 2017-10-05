#!/bin/bash
set -e 

echo " ➡️ trying to update all relevant stuff"
sudo -v

echo " ➡️ Updating apt package list"
sudo apt-get -qq update

echo " ➡️ Updating packages."
sudo apt-get -qq upgrade

echo " ➡️ Updating anaconda distribution"
conda update conda -y
# conda update anaconda -y
# conda update --all -y

#echo " ➡️ Updating atom packages"
#apm upgrade --no-confirm

#echo " ➡️ Updating ruby gems"
#sudo gem update `gem list | cut -d ' ' -f 1`

echo " ➡️ Updating node"
#npm install -g npm@latest
npm update -g

echo " ✅  Done."

date > $DOTFILES/lastupdate

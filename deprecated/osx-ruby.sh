#!/bin/sh

set -e

if test ! $(which brew)
then
    echo "   Install homebrew first. (i..e run osx-brew.sh)"
    exit
fi

cd "$(dirname "$0")"

GEMS=(
    jekyll
)

echo "   Installing rbenv and ruby-build."
brew install rbenv ruby-build

echo "   Install Ruby"
rbenv install 2.4.0
rbenv global 2.4.0

echo "   Add rbenv to zshrc"
echo 'eval "$(rbenv init -)"' >> .zshrc

echo "   Initializing ruby. Version should be 2.4.0"
rbenv init
ruby -v

for package in ${GEM[@]}
do
    gem install $package
done

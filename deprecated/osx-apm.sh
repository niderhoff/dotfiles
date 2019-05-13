#!/bin/sh
#
# Atom package manager
#
# Instal my base packages and their dependencies
#
# inspired by: https://github.com/mrrej89/dotfiles

set -e

# Check for Homebrew
if test ! $(which apm)
then
  echo "  You must first install atom. Try running osx-brew.sh"
fi

cd "$(dirname "$0")"

PACKAGES=(
	atom-beautify
        atom-jinja2
	autoclose-html
        autocomplete-python
	base-16-ocean-dark-ui-theme
	base16-ocean-dark-syntax-theme
	color-picker
	file-icons
	gist
        go-plus
	highlight-selected
	indentation-indicator
        imdone-atom
	language-latex
	language-r
	latex
	linter
        linter-alex
	linter-chktex
        linter-csslint
	linter-flake8
        linter-jshint
        linter-jsonlint
	linter-lintr
        linter-sass-lint
        linter-tidy
        linter-write-good
        linter-xmllint
	markdown-scroll-sync
	merge-conflicts
	minimap
	minimap-autohide
        minimap-highlight-selected
	open-in-browser
        open-recent
	pdf-view
	pigments
        react
	split-diff
        tabs-to-spaces
	todo-show
	Zen
	Hydrogen
)

echo "  Updating package list"
apm upgrade

echo "  Trying to install PACKAGES"
for package in ${PACKAGES[@]}
do
    if [[ ! -d "$HOME/.atom/packages/$package" ]]
    then
        apm install $package
    
    fi
done
echo "  Done."
apm list --installed

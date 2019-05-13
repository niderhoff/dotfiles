#!/usr/bin/env bash
#
# Run the correct dotfiles installer.
# idea: https://github.com/mrrej89/dotfiles/blob/master/script/platform.sh

set -e

cd "$(dirname "$0")"

platform="unknown"
if [[ "$(uname)" == "Darwin" ]]; then
    platform="osx"
elif [[ "$(expr substr $(uname -s) 1 5)" == "Linux" ]]; then
    platform="linux"
elif [[ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]]; then
    platform="windows"
fi

# this is a nice idea, but there is too much that can go wrong here
# find . -name "$platform-*.sh" | while read installer ; do sh -x "${installer}" > /dev/null; done

if [[ "$platform" == "osx" ]]; then
    osx_installers=( brew conda zsh iterm gitignore apm r jupyter )
    for script in ${osx_installers[@]}
    do
        sh -x $platform-$script.sh
    done
fi

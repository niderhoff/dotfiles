#!/usr/bin/env bash

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

if [[ "$platform" == "osx" ]]; then
    osx_installers=( brew conda zsh iterm gitignore apm r jupyter vim )
    for script in ${osx_installers[@]}
    do
        sh -x $platform-$script.sh
    done
elif [[ "$platform" == "linux" ]]; then
    linux_installers=( conda gitignore vim )
    for script in ${linux_installers[@]}
    do
        sh -x $platform-$script.sh
    done
fi

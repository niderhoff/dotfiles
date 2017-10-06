#!/bin/bash
scheme="ocean"
brightness="dark"
declare -a templates=( "vim" "vim-airline" "jupyter-notebook" "iterm2" "atom" "atom-syntax" )
for i in "${templates[@]}"
do
    eval "base16-builder -s $scheme -t $i -b $brightness > base16-$scheme-$brightness-$i"
done

#ln -s /mnt/c/Users/niid/.gitconfig $HOME/.gitconfig
if [ ! -f $HOME/.gitconfig ]; then 
    echo "copying bootstrap gitconfig..."
    cp $DOTFILES/setup/resources/gitconfig_wsl $HOME/.gitconfig
fi
echo "linking vimrc from windows..."
ln -s /mnt/c/Users/niid/.vim $HOME/.vim
ln -s /mng/c/Users/niid/.vim/vimrc $HOME/.vimrc


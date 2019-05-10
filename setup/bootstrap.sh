pip3 install --user dotfiles
cd $HOME
ln -s $HOME/.dotfiles/dotfilesrc .dotfilesrc
dotfiles --sync

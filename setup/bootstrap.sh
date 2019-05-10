if [ ! $PIP_BIN ]; then
    echo "ERROR: NO PIP_PATH set."
    exit 1
fi

if [ ! $DOTFILES ]; then
    echo "ERROR: NO DOTFILES PATH set."
    exit 1
fi

$PIP_BIN install --user dotfiles
cd $HOME
ln -s $DOTFILES/dotfilesrc .dotfilesrc
dotfiles --sync

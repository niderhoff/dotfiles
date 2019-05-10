if [ ! $PIP_BIN ]; then
    echo "ERROR: NO PIP BIN SET"
    exit 1
fi

PIP_PACKAGES=(
    thefuck
    speedtest-cli
)

for pack in ${PIP_PACKAGES[@]}
do
    if [[ ! -a $HOME/.local/bin/$pack ]]; then $PIP_BIN install --user $pack; fi
done


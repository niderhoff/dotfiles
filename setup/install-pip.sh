PIP_BIN=/usr/bin/pip3

if [ ! -f $HOME/.local/bin/thefuck ]; then $PIP_BIN install --user thefuck; fi
if [ ! -f $HOME/.local/bin/speedtest-cli ]; then $PIP_BIN install --user speedtest-cli; fi

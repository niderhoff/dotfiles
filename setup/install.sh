DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

if [ "$1" == "" ] || [ $# -gt 1 ]; then
    echo "Parameter 1 is empty"
    exit 1
fi

if [ "$1" == "wsl" ]; then
    if [[ -f ../proxy ]]; then . ../proxy; fi
    . install-wsl.sh
    . bootstrap.sh
    cd $DIR
    . install-pip.sh
fi

if [ "$1" == "linux" ]; then
    . bootstrap.sh
    cd $DIR
    . install-pip.sh
fi

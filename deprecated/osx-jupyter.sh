# Check for pip
if test ! $(which pip)
then
      echo "  You must first install pip. Try running osx-conda.sh"
  fi

  cd "$(dirname "$0")"

set -e

echo "  Trying to install jupyterthemes"
$HOME/anaconda2/bin/pip install jupyterthemes
echo "  Trying to install theme"
$HOME/anaconda2/bin/jt -t oceans16 -f Hack -fs 10
echo "  Done"

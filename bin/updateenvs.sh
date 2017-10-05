#!/bin/sh
set -e

cd "$(dirname "$0")"

# TODO: this is a workaround for bash throwing the
# 'grep command not found' error whe nusing regex over
# the pipe.
conda env list > /tmp/envlist.txt
ENVS=$(grep "^[^#]" /tmp/envlist.txt | awk '{print $1}')
rm /tmp/envlist.txt

for env in ${ENVS[@]}
do
    echo "   Updating environment $env"
    source $HOME/anaconda2/bin/activate $env
    conda update --all -y
done

echo "   Done."

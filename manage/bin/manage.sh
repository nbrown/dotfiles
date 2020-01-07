#!/bin/bash -
#===============================================================================
#
#          FILE: install.sh
#
#         USAGE: ./install.sh
#
#   DESCRIPTION: 
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 04/02/2017 13:42:52
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error



SCRIPT_DIR=$(dirname "$0")/$(readlink "$0" | xargs dirname)
STOW=${SCRIPT_DIR}/stow

pushd $(dirname "$0") > /dev/null
STOW_DIR=${SCRIPT_DIR}/../../
popd > /dev/null || exit


if [[ ! -x $STOW ]] ; then
    echo 'cannot find stow'
    exit 1
fi

EXCLUDE=".git"
STOW_OPTS=( -t "${HOME}" -d $STOW_DIR --dotfiles --restow --verbose=1 )

shopt -s dotglob
cd "$STOW_DIR" || exit
for p in *; do
    if echo "$p" | grep -q -x "$EXCLUDE" ; then
        echo "$p is excluded" >> /dev/null
    else

        if [[ -d $p ]] ; then
            echo "$p"
            #echo $STOW ${STOW_OPTS[*]} "${p}"
            $STOW ${STOW_OPTS[*]} "${p}"
            echo ""
        fi
    fi
done

#!/bin/bash

SRCDIR=$HOME/.vim/fonts
TARGETDIR=$HOME/.fonts

cd $TARGETDIR
find $SRCDIR -name '*.ttf' -exec ln -s {} . \;
cd -

fc-cache -vf $TARGETDIR

#!/usr/bin/env bash


link() {
    SRCDIR="$1"
    TARGETDIR="$2"
    [ ! -e "$TARGETDIR" ] && mkdir -p "$TARGETDIR"

    find "$SRCDIR" -name '*.ttf' -exec cp {} "$TARGETDIR" \;
}

install_linux() {
    link "$HOME/.vim/fonts" "$HOME/.fonts"
    fc-cache -vf "$TARGETDIR"
}

install_darwin() {
    link "$HOME/.vim/fonts" "$HOME/Library/Fonts"
}

if [[ $(uname -s) == "Darwin" ]]
then
    install_darwin
else
    install_linux
fi


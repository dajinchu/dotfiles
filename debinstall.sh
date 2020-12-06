#!/bin/bash

# Download and install .deb files

# Takes url of .deb as input
function install {
    TEMP_DEB="$(mktemp).deb"
    wget -O "$TEMP_DEB" $1 &&
    sudo apt -f install "$TEMP_DEB"
    rm -f "$TEMP_DEB"
}

# Google play music, pinned release number
install https://github.com/MarshallOfSound/Google-Play-Music-Desktop-Player-UNOFFICIAL-/releases/download/v4.7.1/google-play-music-desktop-player_4.7.1_amd64.deb
#!/bin/bash

function install {
    echo "Installing: ${1}..."
    $(pwd)/programs/$1/$1.sh
}

# TODO: Do it automatically for every folder in programs/
install docker
install git
install vscode
install oh-my-zsh
#!/bin/bash

function install {
    echo "Installing: ${1}..."
    $(pwd)/programs/$1/$1.sh
}

# TODO: Do it automatically for every folder in programs/
install docker
install dslr
install git
install lotion
install nodejs
install oh-my-zsh
install vscode
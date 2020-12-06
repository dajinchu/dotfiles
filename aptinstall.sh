#!/bin/bash

sudo apt update

function install {
  which $1 &> /dev/null

  if [ $? -ne 0 ]; then
    echo "Installing: ${1}..."
    source=${2:-apt}
    yes | sudo $source install ${3:-1}
  else
    echo "Already installed: ${1}"
  fi
}

install curl
install git
install zsh
install vim
install xclip

install slack snap "slack --classic"
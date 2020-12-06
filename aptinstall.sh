#!/bin/bash

# Get Yarn apt source
which yarn &> /dev/null
if [ $? -ne 0 ]; then
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
  sudo apt update
fi

# Get Peek PPA
which peek &> /dev/null
if [ $? -ne 0 ]; then
  sudo apt install software-properties-common
  yes | sudo add-apt-repository ppa:peek-developers/stable
fi

sudo apt update

function install {
  which $1 &> /dev/null

  if [ $? -ne 0 ]; then
    echo "Installing: ${1}..."
    source=${2:-apt}
    yes | sudo $source install ${3:-$1}
  else
    echo "Already installed: ${1}"
  fi
}

install curl
install git
install zsh
install vim
install xclip
install postgresql-client
install yarn

install slack snap "slack --classic"

install peek
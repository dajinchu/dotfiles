#!/bin/bash

# Get Yarn apt source
which yarn &> /dev/null
if [ $? -ne 0 ]; then
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
fi

# Get Github CLI source
which gh &> /dev/null
if [ $? -ne 0 ]; then
  sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0
  sudo apt-add-repository https://cli.github.com/packages
fi

sudo apt install software-properties-common

function getPPA {
  yes | sudo add-apt-repository ppa:$1
}


# Get Peek PPA
getPPA peek-developers/stable
# Get racket PPA
getPPA plt/racket

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
install gh
install racket

install slack snap "slack --classic"

install peek

# DSLR Stuff
install gphoto2 
install v4l2loopback-utils 
install v4l2loopback-dkms 
install ffmpeg
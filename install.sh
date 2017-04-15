#!/usr/bin/env bash

set -e
apt-get update
apt-get -y install git\
	tmux\
	cmake\
	curl\
	libtool libtool-bin\
	g++ pkg-config\
	autoconf automake libncurses5-dev\
	software-properties-common\
	python-pip\
	vim\
    zsh\
    build-essential

pip install powerline-status

#Get or update neovim github repo
mkdir -p ~/src
cd ~/src
if [ ! -e ~/src/neovim ]; then
  git clone https://github.com/neovim/neovim.git
else
  cd neovim
  git pull origin
fi

cd ~/src/neovim
#Checkout stable release
# git checkout v0.1.7
#Remove old build dir
#rm -r build/

# Build and install neovim
make CMAKE_BUILD_TYPE=RelWithDebInfo
make install

# Enable use of python plugins
# pip2 install --user --upgrade neovim


##	neovim\
##add-apt-repository ppa:neovim-ppa/unstable
##apt-get update
##apt-get install neovim
## bash Anaconda3
os="$(uname)"
echo "$os"
## if["$os"=="Linux"]; then
##  echo "Install neovim from os repositories"
## fi

## if[!-d "$HOME/tmp"]; then
##    mkdir $HOME/tmp
##fi
## curl -o $HOME/tmp/conda.sh https://repo.continuum.io/archive/Anaconda3-4.3.1-Linux-x86_64.sh

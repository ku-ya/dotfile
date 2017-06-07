#!/usr/bin/env bash

set -e
sudo apt-get update
sudo apt-get -y install git\
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
    xclip\
    build-essential

#if [ ! -d "~/anaconda3" ]; then
#	wget https://repo.continuum.io/archive/Anaconda3-4.3.1-Linux-x86_64.sh -O ~/anaconda.sh
#	bash ~/anaconda.sh -b -p $HOME/anaconda
#	export PATH="$HOME/anaconda3/bin:$PATH"
#fi


#export PATH="$HOME/anaconda3/bin:$PATH"

sudo apt-get install python-dev python-pip python3-dev python3-pip

pip install -U pip
pip install powerline-status
pip install powerline-gitstatus

# neovim install
#sudo apt-get install software-properties-common
#sudo add-apt-repository ppa:neovim-ppa/stable
#sudo apt-get update
#sudo apt-get install neovim

#Get or update neovim github repo
if [ ! -d "~/src" ]; then
	mkdir -p ~/Documents/src
fi
cd ~/Documents/src
if [ ! -e ~/Documents/src/neovim ]; then
  git clone https://github.com/neovim/neovim.git
else
  cd neovim
fi

cd ~/Documents/src/neovim
#Checkout stable release
# git checkout v0.1.7
#Remove old build dir
#rm -r build/

# Build and install neovim
make CMAKE_BUILD_TYPE=RelWithDebInfo
make install
pip3 install neovim
# Enable use of python plugins
#pip2 install --user --upgrade neovim
apt-get install pandoc -y

##	neovim\
##add-apt-repository ppa:neovim-ppa/unstable
##apt-get update
##apt-get install neovim
## bash Anaconda3
#os="$(uname)"
#echo "$os"
## if["$os"=="Linux"]; then
##  echo "Install neovim from os repositories"
## fi

## if[!-d "$HOME/tmp"]; then
##    mkdir $HOME/tmp
##fi
## curl -o $HOME/tmp/conda.sh https://repo.continuum.io/archive/Anaconda3-4.3.1-Linux-x86_64.sh

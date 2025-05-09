#!/bin/bash

function install_deps() {
sudo apt update && sudo apt-get install git curl wget aptitude zsh zsh-doc zsh-autosuggestions zsh-syntax-highlighting fonts-hack-ttf
}

function install_dfm() {
DFM_VERSION=$(uname -s | tr A-Z a-z)_amd64 # "darwin_amd64" or "linux_amd64"curl -sSL https://github.com/cgamesplay/dfm/releases/latest/download/$DFM_VERSION.tar.gz -o dfm.tar.gz
tar -xf dfm.tar.gz
sudo mv dfm /usr/local/bin/
}

function install_oh-my-zsh() {
chsh -s $(which zsh) #  set ZSH as default shell for $USER
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}

git clone --recursive https://github.com/nativeit-dev/dfm-init.git ${HOME}/.dfm

install_deps
install_dfm
# install_oh-my-zsh
${HOME}/.dfm/bootstrap.sh

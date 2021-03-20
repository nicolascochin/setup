#!/usr/bin/env bash

echo "Setup a new dev toolbox"
echo "install ZSH"
sudo dnf install -qy zsh
echo "install development Tools"
sudo dnf groupinstall -qy "Development Tools"
echo "install zlib & openssl lib"
sudo dnf install -qy zlib-devel openssl-devel
echo "install rbenv"
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-installer | bash
echo "install nodenv"
curl -fsSL https://raw.githubusercontent.com/nodenv/nodenv-installer/master/bin/nodenv-installer | bash
git clone -q https://github.com/mattberther/zsh-nodenv ~/.oh-my-zsh/custom/plugins/zsh-nodenv

echo "install vscode"
sudo dnf -qy install libX11-devel
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
#sudo dnf check-update
sudo dnf install -qy code

echo "install lib PG"
sudo dnf install -qy libpq-devel

echo "install Heroku cli"
curl -s https://cli-assets.heroku.com/install.sh | sh

#echo "install netlify cli"
#npm install netlify-cli -g

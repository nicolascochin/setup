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

#echo "install vscode"
#sudo dnf -qy install libX11-devel
#sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
#sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
##sudo dnf check-update
#sudo dnf install -qy code

echo "install lib PG"
sudo dnf install -qy libpq-devel

echo "install Heroku cli"
curl -s https://cli-assets.heroku.com/install.sh | sh

#echo "install code extensions"
#for i in $(curl -s https://raw.githubusercontent.com/nicolascochin/setup/main/toolbox/code_extensions.txt); do 
#  echo "Install $i..."
#  code --install-extension  $i
#done

echo "Setup ssh server"
sudo dnf -qy install openssh-server
sudo /usr/libexec/openssh/sshd-keygen rsa
sudo /usr/libexec/openssh/sshd-keygen ecdsa
sudo /usr/libexec/openssh/sshd-keygen ed25519
sudo rm /etc/ssh/sshd_config
sudo touch /etc/ssh/sshd_config
echo "Port 2222                 # Prevent conflicts with other SSH servers" | sudo tee -a /etc/ssh/sshd_config
echo "ListenAddress localhost   # Don’t allow remote connections" | sudo tee -a /etc/ssh/sshd_config
echo "PermitEmptyPasswords yes  # Containers lack passwords by default" | sudo tee -a /etc/ssh/sshd_config

echo "Add this line to the zshrc" 
echo "toolbox run -c dev sudo /usr/sbin/sshd"
echo
echo "Add the following lines to ~/.ssh/config"
echo
echo "Host toolbox"
echo "    HostName localhost"
echo "    Port 2222"
#echo "install netlify cli"
#npm install netlify-cli -g

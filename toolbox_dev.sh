#/bin/bash

while
  echo -n "Please enter the SSH port to setup "
  read SSH_PORT
  ! echo ${SSH_PORT} | egrep -q "^[0-9]+$"
do true; done
while
  echo -n "Please enter the Toolbox name "
  read TOOLBOX_NAME
  ! echo ${TOOLBOX_NAME} | egrep -q "^[a-zA-Z_-]+$"
do true; done

echo
echo "Setup a dev toolbox"
echo "install ZSH & bat"
sudo dnf install -qy zsh bat
echo "install development Tools"
sudo dnf groupinstall -qy "Development Tools"
echo "install zlib & openssl lib"
sudo dnf install -qy zlib-devel openssl-devel
echo "install rbenv"
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-installer | bash
echo "install nodenv"
curl -fsSL https://raw.githubusercontent.com/nodenv/nodenv-installer/master/bin/nodenv-installer | bash
git clone -q https://github.com/mattberther/zsh-nodenv ~/.oh-my-zsh/custom/plugins/zsh-nodenv

echo "install lib PG"
sudo dnf install -qy libpq-devel

echo "install Heroku cli"
curl -s https://cli-assets.heroku.com/install.sh | sh

echo "Setup ssh server"
sudo dnf -qy install openssh-server
sudo /usr/libexec/openssh/sshd-keygen rsa
sudo /usr/libexec/openssh/sshd-keygen ecdsa
sudo /usr/libexec/openssh/sshd-keygen ed25519
sudo rm /etc/ssh/sshd_config
sudo touch /etc/ssh/sshd_config
sudo tee -a /etc/ssh/sshd_config > /dev/null <<EOF
Port ${SSH_PORT}          # Prevent conflicts with other SSH servers
ListenAddress localhost   # Don’t allow remote connections
PermitEmptyPasswords yes  # Containers lack passwords by default
EOF

if [ ! -d ~/.ssh ]; then 
  mkdir ~/.ssh
fi
touch ~/.ssh/config
tee -a ~/.ssh/config > /dev/null <<EOF
Host toolbox-${TOOLBOX_NAME}
    HostName localhost
    Port ${SSH_PORT}
EOF
echo
echo "Add this line to the zshrc"
echo "alias start-${TOOLBOX_NAME}=\"toolbox run -c ${TOOLBOX_NAME} sudo /usr/sbin/sshd\""

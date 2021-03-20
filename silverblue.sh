echo "add rpm fusion repos"
sudo rpm-ostree install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
echo "install chromium, bat & zsh"
sudo rpm-ostree install mozilla-openh264 chromium-freeworld bat zsh
echo "set ZSH as default shell"
sudo usermod --shell /bin/zsh nico
echo "install oh my zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "Download fonts (https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k) into ~/.local/share/fonts"
read
echo "Setup gnome terminal to use the new font"
read
echo "install powerlevel10k"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
echo "install syntax highlighted"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# activate the plugin (MUST BE THE LAST ONE)
echo "install fzf"
#fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
echo "copy config files"

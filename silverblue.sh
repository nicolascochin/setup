echo "add rpm fusion repos"
sudo rpm-ostree install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
reboot
echo "install chromium, bat & zsh"
sudo rpm-ostree install mozilla-openh264 chromium-freeworld bat zsh fprintd fprintd-pam 
echo "set ZSH as default shell"
sudo usermod --shell /bin/zsh nico
reboot

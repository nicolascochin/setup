echo "install oh my zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "install anyenv"
git clone https://github.com/anyenv/anyenv ~/.anyenv
~/.anyenv/bin/anyenv install --force-init
echo "Download fonts (https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k) into ~/.local/share/fonts"
FONT_DIR=~/.local/share/fonts 
mkdir -p $FONT_DIR
curl -fsSL https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf       -o "${FONT_DIR}/MesloLGS NF Regular.ttf"
curl -fsSL https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf          -o "${FONT_DIR}/MesloLGS NF Bold.ttf"
curl -fsSL https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf        -o "${FONT_DIR}/MesloLGS NF Italic.ttf"
curl -fsSL https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf -o "${FONT_DIR}/MesloLGS NF Bold Italic.ttf"
curl -fsSL https://github.com/tonsky/FiraCode/raw/master/distr/ttf/FiraCode-Bold.ttf                   -o "${FONT_DIR}/FiraCode-Bold.ttf"
curl -fsSL https://github.com/tonsky/FiraCode/raw/master/distr/ttf/FiraCode-Light.ttf                  -o "${FONT_DIR}/FiraCode-Light.ttf"
curl -fsSL https://github.com/tonsky/FiraCode/raw/master/distr/ttf/FiraCode-Medium.ttf                 -o "${FONT_DIR}/FiraCode-Medium.ttf"
curl -fsSL https://github.com/tonsky/FiraCode/raw/master/distr/ttf/FiraCode-Regular.ttf                -o "${FONT_DIR}/FiraCode-Regular.ttf"
curl -fsSL https://github.com/tonsky/FiraCode/raw/master/distr/ttf/FiraCode-Retina.ttf                 -o "${FONT_DIR}/FiraCode-Retina.ttf"
curl -fsSL https://github.com/tonsky/FiraCode/raw/master/distr/ttf/FiraCode-SemiBold.ttf               -o "${FONT_DIR}/FiraCode-SemiBold.ttf"
echo "install powerlevel10k"
git clone -q --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
echo "install syntax highlighted"
git clone -q https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
echo "Setup nvim"
sh -c 'curl -sfLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
echo "copy config files"
for i in .gitconfig .p10k.zsh .tmux.conf .zshrc .config/nvim/general.vim .config/nvim/init.vim .config/nvim/plug.vim .config/nvim/theme.vim .config/nvim/plugins/fzf.vim .config/nvim/plugins/lightline.vim .config/nvim/plugins/nerdtree.vim; do
  echo "Setting $i"
  curl -s https://raw.githubusercontent.com/nicolascochin/setup/main/shell_config_files/$i --create-dirs -o $i
done
echo "install cheat.sh"
mkdir -p ~/.local/bin
curl https://cht.sh/:cht.sh > ~/.local/bin/cht.sh
chmod +x ~/.local/bin/cht.sh
echo "install fzf"
git clone -q --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

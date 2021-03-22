" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin()

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'                                 " Swap surrounding such as quotes/tags...
Plug 'tpope/vim-rails'                                    " Rails plugin
Plug 'tpope/vim-endwise'
Plug 'sonph/onehalf', { 'rtp': 'vim' }                    " Theme
Plug 'itchyny/lightline.vim'                              " Bottom line
Plug 'tpope/vim-fugitive'                                 " Git inside vim
Plug 'airblade/vim-gitgutter'                             " Show git changes
" Dependencies
" bat => https://github.com/sharkdp/bat
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }       " FZF integration
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'tpope/vim-commentary'


" Initialize plugin system
call plug#end()

call plug#begin('~/.config/nvim/pack/plugins/start')

        "Fugitive Vim Github Wrapper
        Plug 'tpope/vim-fugitive', { 'on': 'Gstatus' }
        Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
        Plug 'easymotion/vim-easymotion'
        Plug 'tpope/vim-surround'
        "Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
        "Plug 'NLKNguyen/papercolor-theme'
        "Plug 'jremmen/vim-ripgrep'

call plug#end()

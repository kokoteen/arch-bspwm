call plug#begin('~/.config/nvim/pack/plugins/start')

    Plug 'tpope/vim-fugitive', { 'on': 'Gstatus' }
    Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
    Plug 'easymotion/vim-easymotion'
    Plug 'tpope/vim-surround'
    "Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'michaeljsmith/vim-indent-object'
    Plug 'mbbill/undotree'
    Plug 'jremmen/vim-ripgrep'
    "Plug 'NLKNguyen/papercolor-theme'

call plug#end()

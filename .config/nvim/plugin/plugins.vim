call plug#begin('~/.config/nvim/pack/plugins/start')

    Plug 'tpope/vim-fugitive', { 'on': 'Gstatus' }
    Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
    Plug 'easymotion/vim-easymotion'
    Plug 'tpope/vim-surround'
    Plug 'michaeljsmith/vim-indent-object'
    Plug 'mbbill/undotree'
    Plug 'jremmen/vim-ripgrep'
    Plug 'machakann/vim-swap'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-treesitter/playground'
    Plug 'hrsh7th/nvim-compe'
    Plug 'neovim/nvim-lspconfig'
    " dependencies
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    " telescope
    Plug 'nvim-telescope/telescope.nvim'
    " colors
    Plug 'ful1e5/onedark.nvim'
    "Plug 'NLKNguyen/papercolor-theme'
    " cloror parentheses
    Plug 'p00f/nvim-ts-rainbow'
call plug#end()

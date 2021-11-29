" --- General

syntax on
syntax enable

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set number
set numberwidth=4
set relativenumber
set signcolumn=yes:1
set noswapfile
set nobackup
set undodir=~/.config/nvim/undodir
set undofile
set incsearch
set nohlsearch
set ignorecase
set smartcase
set nowrap
set splitbelow
set splitright
set hidden
set scrolloff=8
set noshowmode
set updatetime=250
set encoding=UTF-8
set guicursor=

" --- Plugins

call plug#begin('~/.config/nvim/plugged')

" -- General 
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', {'do': 'make' }
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'lewis6991/gitsigns.nvim'
Plug 'LunarWatcher/auto-pairs'

" -- LSP
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate' }

" - Autocompletion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'onsails/lspkind-nvim'

" -- Themes
Plug 'sainnhe/gruvbox-material'

call plug#end()

" --- Config
lua require('lua-config')

" --- Remaps

let mapleader = ' '

" -- Normal Mode
nnoremap <leader>h <C-w><C-h>
nnoremap <leader>j <C-w><C-j>
nnoremap <leader>k <C-w><C-k>
nnoremap <leader>l <C-w><C-l>
nnoremap <leader><Tab> :bn<Cr>
nnoremap <leader><S-Tab> :bp<Cr>

nnoremap <C-p> :Telescope find_files<Cr>
nnoremap <C-l> :Telescope buffers<Cr>

" -- Insert Mode
inoremap <C-c> <Esc>

" --- Colorscheme

set termguicolors
set background=dark
colorscheme gruvbox-material

" -- Transparency
highlight Normal ctermbg=NONE guibg=NONE
highlight NonText ctermbg=NONE guibg=NONE
highlight LineNr ctermbg=NONE guibg=NONE
highlight Folded ctermbg=NONE guibg=NONE
highlight EndOfBuffer ctermbg=NONE guibg=NONE
highlight CursorLineNr ctermbg=NONE guibg=NONE
highlight SignColumn ctermbg=NONE guibg=NONE

" - Sign Transparency
highlight RedSign ctermbg=NONE guibg=NONE
highlight YellowSign ctermbg=NONE guibg=NONE
highlight BlueSign ctermbg=NONE guibg=NONE
highlight AquaSign ctermbg=NONE guibg=NONE
highlight GreenSign ctermbg=NONE guibg=NONE
highlight PurpleSign ctermbg=NONE guibg=NONE


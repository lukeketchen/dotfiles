
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-unimpaired'                            "Matching bracket highlighing
Plug 'neoclide/coc.nvim', {'branch': 'release'}        "simple snipets & autocomplete
Plug 'sheerun/vim-polyglot'                            "Language pack
Plug 'dracula/vim', { 'as': 'dracula' }                "Theme
Plug 'morhetz/gruvbox'                                 "Theme
Plug 'preservim/nerdtree'                              "NerdTree file explorer
Plug 'Xuyuanp/nerdtree-git-plugin'                     "NerdTree git icons
Plug 'ryanoasis/vim-devicons'                          "Icons for NerdTree
Plug 'mattn/emmet-vim'                                 "Emmet with ,,
Plug 'tpope/vim-commentary'                            "comment out with gcc
Plug 'pangloss/vim-javascript'                         "javascript syntax & indenting
Plug 'prettier/vim-prettier', { 'do': 'yarn install' } "Prettier called with <Leader>p
Plug 'tpope/vim-surround'                              "Add or edit surround brackets for text
Plug 'nelstrom/vim-visual-star-search'                 "Search in visual mode with *
Plug 'yegappan/grep'                                   "Grep tool type :Rg to find and replace in filetree

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }    "Fuzzy finder
Plug 'junegunn/fzf.vim'                                "Fuzzy finder
Plug 'tpope/vim-fugitive'                              "Git plugin - installed for fzf preview

Plug 'vim-scripts/AutoComplPop'                          "Automatically opens the popup menu for auto complete

"Plug 'shmargum/vim-sass-colors'   "Sass colours - currently not working
"Plug 'vuciv/vim-bujo'             "Todo list
"Plug 'haishanh/night-owl.vim'     "Theme - currently not working

call plug#end()


"=====================================
" Setting up vim
"=====================================

let mapleader = ","
set nocompatible

" Line Numbers
set relativenumber
set number

" indenting
filetype indent plugin on
set ignorecase
set smartcase
set autoindent
set tabstop=4 softtabstop=4
set expandtab
set noerrorbells
set shiftwidth=4
set smartindent

" file management
set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir//
set undofile
set incsearch

"~~~ Complete popup menu
set complete+=kspell
set completeopt=menuone,longest
set shortmess+=c


"======================================
" Remapping keys
"=====================================

"~~~ NerdTree
map <C-n> :NERDTreeToggle<CR>

"~~~ Emmet commplete
let g:user_emmet_leader_key=','

"~~~ Control S to save
nnoremap <c-s> :w<CR>
inoremap <c-s> <Esc>:w<CR>l
vnoremap <c-s> <Esc>:w<CR>

"~~~ Replace highlighted word - works well with <shift>8 as this finds all instance in file
nnoremap <Leader>r :%s///g<Left><Left>
nnoremap <Leader>r :%s///gc<Left><Left><Left>

"~~~ Popup AutoComplete
inoremap <expr> <Right> pumvisible() ? "<C-y>" : "<Right>"

"====================================
"                FZF
" ==================================

"fzf settings
"let g:ackprg = 'ag --nogroup --nocolor --column'

"~~~~Open FZF
map <C-f> <Esc><Esc>:Files!<CR>
inoremap <C-f> <Esc><Esc>:BLines!<CR>
map <C-g> <Esc><Esc>:BCommits!<CR>
nnoremap <silent> <Leader>f :Rg<CR>

"======================================
" SNIPPETS
" =====================================

" Plain html
" nnoremap <leader>html :-1read $HOME/.vim/.skeleton.html<CR>3jwf>a




"=======================================
" Settings for color scheme
" =====================================

if (&term == "pcterm" || &term == "win32")
set term=xterm t_Co=256
let &t_AB="\e[48;5;%dm"
let &t_AF="\e[38;5;%dm"
set termencoding=utf8
set nocompatible
inoremap <Char-0x07F> <BS>
nnoremap <Char-0x07F> <BS>
endif

set encoding=UTF-8
set background=dark
syntax enable
syntax on
"colorscheme dracula
"colorscheme night-owl
"colorscheme gruvbox




"======================================
" Disable features
"======================================
"disable the arrow keys in escape mode
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
" "disable the arrow keys in insert mode
" imap <up> <nop>
" imap <down> <nop>
" imap <left> <nop>
" imap <right> <nop>


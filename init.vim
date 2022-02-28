"                                        o
"                                      o   o
"                                    o       o
"                                  o           o
"                                o               o
"                              o     ||   //       o
"                            o       ||  //          o
"                          o         || //             o
"                        o           ||//               o
"                          o         ||\\              o
"                            o       || \\           o
"                              o     ||  \\        o
"                                o   ||   \\     o
"                                  o           o
"                                    o       o
"                                      o   o
"                                        o
"
"
"
"       Personal neo vim configuration of Luke Ketchen <luke@gmail.com.com>
"
"--------------------------------------------------------------------------
" General settings
"--------------------------------------------------------------------------

set expandtab
set shiftwidth=4
set tabstop=4
set hidden
set signcolumn=yes:2
set relativenumber
set number
set termguicolors
set undofile
set spell
set title
set ignorecase
set smartcase
" set wildode=longest:full,full
set nowrap
set list
set listchars=tab:▸\ ,trail:·
set mouse=a
set scrolloff=8
set sidescrolloff=8
set nojoinspaces
set splitright
set clipboard=unnamedplus
set confirm
set exrc
set backup
set backupdir=~/.local/share/nvim/backup//
set updatetime=300 " Reduce time for highlighting other references
set redrawtime=10000 " Allow more time for loading syntax on large files

"--------------------------------------------------------------------------
" Key maps
"--------------------------------------------------------------------------

let mapleader = "\<Space>"

nmap <leader>ve :edit ~/.config/nvim/init.vim<cr>
nmap <leader>vc :edit ~/.config/nvim/coc-settings.json<cr>
nmap <leader>vr :source ~/.config/nvim/init.vim<cr>

nmap <leader>k :nohlsearch<CR>
nmap <leader>Q :bufdo bdelete<cr>

" Allow gf to open non-existent files
map gf :edit <cfile><cr>

" Reselect visual selection after indenting
vnoremap < <gv
vnoremap > >gv

" Maintain the cursor position when yanking a visual selection
" http://ddrscott.github.io/blog/2016/yank-without-jank/
vnoremap y myy`y
vnoremap Y myY`y

" When text is wrapped, move by terminal rows, not lines, unless a count is provided
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" Paste replace visual selection without copying it
vnoremap <leader>p "_dP

" Make Y behave like the other capitals
nnoremap Y y$

" Keep it centered
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" Open the current file in the default program
nmap <leader>x :!xdg-open %<cr><cr>

" Quicky escape to normal mode
imap jj <esc>

" Quicky escape to normal mode and save
imap ww <esc>:w<Esc>

" Easy insertion of a trailing ; or , from insert mode
imap ;; <Esc>A;<Esc>
imap ,, <Esc>A,<Esc>

cmap w!! %!sudo tee > /dev/null %

"--------------------------------------------------------------------------
" Plugins
"--------------------------------------------------------------------------

" Automatically install vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(data_dir . '/plugins')

" source ~/.dotfiles/nvim/plugins/abolish.vim
source ~/.dotfiles/nvim/plugins/airline.vim
source ~/.dotfiles/nvim/plugins/arduino.vim
" source ~/.dotfiles/nvim/plugins/coc.vim
source ~/.dotfiles/nvim/plugins/commentary.vim
source ~/.dotfiles/nvim/plugins/context-commentstring.vim
source ~/.dotfiles/nvim/plugins/dispatch.vim
source ~/.dotfiles/nvim/plugins/dracula.vim
source ~/.dotfiles/nvim/plugins/nightowl.vim
" source ~/.dotfiles/nvim/plugins/dotfiles.vim
source ~/.dotfiles/nvim/plugins/eunuch.vim
source ~/.dotfiles/nvim/plugins/exchange.vim
source ~/.dotfiles/nvim/plugins/firenvim.vim
source ~/.dotfiles/nvim/plugins/floaterm.vim
source ~/.dotfiles/nvim/plugins/fugitive.vim
source ~/.dotfiles/nvim/plugins/fzf.vim
source ~/.dotfiles/nvim/plugins/heritage.vim
source ~/.dotfiles/nvim/plugins/lastplace.vim
source ~/.dotfiles/nvim/plugins/lion.vim
source ~/.dotfiles/nvim/plugins/markdown-preview.vim
source ~/.dotfiles/nvim/plugins/nerdtree.vim
source ~/.dotfiles/nvim/plugins/pasta.vim
source ~/.dotfiles/nvim/plugins/peekaboo.vim
source ~/.dotfiles/nvim/plugins/phpactor.vim
source ~/.dotfiles/nvim/plugins/polyglot.vim
source ~/.dotfiles/nvim/plugins/projectionist.vim
source ~/.dotfiles/nvim/plugins/quickscope.vim
source ~/.dotfiles/nvim/plugins/repeat.vim
source ~/.dotfiles/nvim/plugins/rooter.vim
source ~/.dotfiles/nvim/plugins/sayonara.vim
source ~/.dotfiles/nvim/plugins/smooth-scroll.vim
source ~/.dotfiles/nvim/plugins/splitjoin.vim
source ~/.dotfiles/nvim/plugins/surround.vim
source ~/.dotfiles/nvim/plugins/targets.vim
source ~/.dotfiles/nvim/plugins/textobj-xmlattr.vim
" source ~/.dotfiles/nvim/plugins/tmux-navigator.vim
source ~/.dotfiles/nvim/plugins/unimpaired.vim
source ~/.dotfiles/nvim/plugins/vim-test.vim
source ~/.dotfiles/nvim/plugins/visual-multi.vim
source ~/.dotfiles/nvim/plugins/visual-star-search.vim
source ~/.dotfiles/nvim/plugins/which-key.vim
source ~/.dotfiles/nvim/plugins/transparent.vim
source ~/.dotfiles/nvim/plugins/dashboard.vim
call plug#end()
doautocmd User PlugLoaded


" If you have vim >=8.0 or Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif


syntax enable
colorscheme night-owl

" To enable the lightline theme
let g:lightline = { 'colorscheme': 'nightowl' }

"--------------------------------------------------------------------------
" Miscellaneous
"--------------------------------------------------------------------------

augroup FileTypeOverrides
    autocmd!
    " Use '//' instead of '/* */' comments
    autocmd FileType php setlocal commentstring=//%s
    autocmd TermOpen * setlocal nospell
augroup END

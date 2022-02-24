set nocompatible
set showmatch
set ignorecase
set number relativenumber
set linebreak
set backspace=indent,eol,start
set textwidth=80
set shiftwidth=2
set tabstop=2
set softtabstop=2
set autoindent
set smartindent
set ruler
set hidden
set wrap linebreak
set nohlsearch
syntax on

filetype plugin indent on

highlight clear LineNr

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors

call plug#begin('~/.config/nvim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-vetur'
Plug 'morhetz/gruvbox'
Plug 'haishanh/night-owl.vim'
Plug 'cormacrelf/dark-notify'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'mattn/emmet-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/indentLine'
Plug 'wesQ3/vim-windowswap'
call plug#end()

:lua <<EOF
local dn = require('dark_notify')

dn.run({
	schemes = {
		dark = {
			colorscheme = 'night-owl',
			airline_theme = 'night_owl'
		},
		light = {
			colorscheme = 'gruvbox',
			airline_theme = 'gruvbox'
		}
	}
})
EOF

command! -nargs=0 Prettier :CocCommand prettier.formatFile

nnoremap <Leader>sv :source $MYVIMRC<CR>

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
"nnoremap <C-f> :NERDTreeFind<CR>
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

let g:airline#extensions#tabline#enabled = 1
"let g:airline_theme='night_owl'

:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
:  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
:augroup END


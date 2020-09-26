" Global Rules:
syntax on
filetype plugin indent on
let mapleader =" "
set mouse=a " Mouse features set to all
set encoding=utf-8 spelllang=en_us
set ruler " Always show cursor location on bottom-right
set scrolloff=2 " how many lines does the cursor need as cushion space
set clipboard=unnamedplus " Makes yanking/pasting to global clipboard
set splitbelow splitright " set splitting to be more normal:
set textwidth=80 " Max line width before linebreak is triggered
set linebreak wrap " Wrap uses terminal width; linebreak uses specified width
set updatetime=50
set colorcolumn=80
autocmd BufWritePre * %s/\s\+$//e " Clears trailing Whitespace on save.
set incsearch
set noswapfile nobackup
set foldenable foldmethod=syntax
set hidden " To use buffers without having to write to file
set autoindent " Automatically indent code that vim recognizes.
set expandtab tabstop=2 shiftwidth=2 softtabstop=2
set wildmenu wildmode=full ignorecase smartcase
" set autochdir
" set cursorline cursorcolumn " Sets crossairs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Load Plugins:
call plug#begin()
Plug 'morhetz/gruvbox'
Plug 'ap/vim-buftabline'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'jremmen/vim-ripgrep'
" Plug 'junegunn/fzf.vim'
call plug#end()
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Gruvbox Specifics:
let g:gruvbox_italic=1
let g:gruvbox_inverse=1
let g:gruvbox_bold=1
let g:gruvbox_contrast_dark = 'medium'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colorscheme:
set background=dark
set termguicolors " Tell vim to use truecolor support
colorscheme gruvbox
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fileype Specific:
autocmd VimLeave *.tex !texclear %
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " NERDTree:
" let g:NERDTreeDirArrowExpandable = ''
" let g:NERDTreeDirArrowCollapsible = ''
" let NERDTreeMinimalUI = 1
" let NERDTreeDirArrows = 1
" let NERDTreeQuitOnOpen = 1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keybinds:

" External Runnables:
noremap <leader>lc :update<CR> :!compiler <c-r>%<CR>
noremap <leader>lp :!opout <c-r>%<CR><CR>

" Plugin:
noremap <silent><leader>vs :vs<CR>
noremap <silent><leader>ps :Rg<SPACE>
" noremap <silent><m-p> :NERDTreeToggleVCS<CR> :vertical resize 20<CR>
noremap <silent><m-p> :FZF<CR>

" Window Management:
noremap <C-l>              :wincmd h<CR>
noremap <C-h>              :wincmd l<CR>
noremap <C-j>              :wincmd j<CR>
noremap <C-k>              :wincmd k<CR>
noremap <leader><leader>h  :vertical resize +2<CR>
noremap <leader><leader>l  :vertical resize -2<CR>
noremap <leader><leader>j  :resize +2<CR>
noremap <leader><leader>k  :resize -2<CR>

" Clears The Last Search:
nnoremap <silent><nowait> <leader><esc> :let @/ = ""<CR>

" Reindent File:
noremap <silent><leader>i gg=G:retab<CR>

" Alt Keys:
noremap <silent><m-q> :bdelete<CR>
noremap <silent><m-l> :bnext<CR>
noremap <silent><m-h> :bprev<CR>
noremap <m-k> <C-u>
noremap <m-j> <C-d>

" Misc:
nnoremap Y y$
noremap <leader>o :setlocal spell! spelllang=en_us<CR>
noremap W :update<CR>
noremap Q :q<CR>

" Terminal:
noremap <leader><CR> :split term://zsh<CR> :resize 15<CR>a
tnoremap <Esc> <C-\><C-n>
tnoremap <m-q> <C-\><C-n>:bd!<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

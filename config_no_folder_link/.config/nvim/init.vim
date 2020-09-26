" Never Touch:
syntax on
filetype plugin indent on
set encoding=utf-8 spelllang=en_us
set termguicolors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Native Settings:
let mapleader =" "
set mouse=a " Mouse features set to all
set scrolloff=2 " how many lines does the cursor need as cushion space
set clipboard=unnamedplus " Makes yanking/pasting to global clipboard
set splitbelow splitright " set splitting to be more normal:
set textwidth=80 " Max line width before linebreak is triggered
set linebreak " Wrap uses terminal width; linebreak uses specified width
set updatetime=50
set colorcolumn=80
set incsearch
set noswapfile nobackup
set foldenable foldmethod=syntax
set hidden " To use buffers without having to write to file
set expandtab tabstop=2 shiftwidth=2 softtabstop=2
set wildmenu wildmode=full ignorecase smartcase
set laststatus=1
" set cursorline cursorcolumn " Sets crossairs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Load Plugins:
call plug#begin()
Plug 'morhetz/gruvbox'
Plug 'preservim/nerdtree'
Plug 'ap/vim-buftabline'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'jremmen/vim-ripgrep'
" Plug 'junegunn/fzf.vim'
call plug#end()
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pluggin Settings:
let g:buftabline_indicators=1
let g:gruvbox_italic=1
let g:gruvbox_inverse=1
let g:gruvbox_bold=1
let g:gruvbox_contrast_dark = 'medium'
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeQuitOnOpen = 1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colorscheme:
colorscheme gruvbox
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autocommands:
autocmd VimLeave *.tex !texclear %
autocmd BufWritePre * %s/\s\+$//e " Clears trailing Whitespace on save.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keybinds:
" Leader:
noremap <leader>o  :setlocal spell! spelllang=en_us<CR>
noremap <leader>lc :update<CR> :!compiler <c-r>%<CR>
noremap <leader>lp :!opout <c-r>%<CR><CR>
noremap <leader>i  gg=G
noremap <leader>vs :vs<CR>
noremap <leader>ps :Rg<SPACE>
noremap <leader><esc> :let @/ = ""<CR>
" Control:
noremap <silent><C-l> :wincmd h<CR>
noremap <silent><C-h> :wincmd l<CR>
noremap <silent><C-j> :wincmd j<CR>
noremap <silent><C-k> :wincmd k<CR>
noremap <silent><C-p> :NERDTreeToggleVCS<CR> :vertical resize 20<CR>
" Alt:
noremap <m-q> :bdelete<CR>
noremap <m-l> :bnext<CR>
noremap <m-h> :bprev<CR>
noremap <m-k> <C-u>
noremap <m-j> <C-d>
noremap <m-p> :FZF<CR>
" Leader Leader:
noremap <leader><leader>h :vertical resize +2<CR>
noremap <leader><leader>l :vertical resize -2<CR>
noremap <leader><leader>j :resize +2<CR>
noremap <leader><leader>k :resize -2<CR>
" Misc:
noremap Y y$
noremap W :update<CR>
noremap Q :q<CR>
" Terminal:
noremap <leader><CR> :split term://zsh<CR> :resize 15<CR>a
tnoremap <Esc> <C-\><C-n>
tnoremap <m-q> <C-\><C-n>:bd!<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Global Rules:
syntax on
filetype plugin indent on
let mapleader =" "
set mouse=a " Mouse features set to all
set encoding=utf-8 spelllang=en_us
set ruler " Always show cursor location on bottom-right
set scrolloff=2 " how many lines does the cursor need as cushion space
set clipboard=unnamedplus
set splitbelow splitright " set splitting to be more normal:
set linebreak " Makes line wrapping better
set textwidth=80 " Max line width before linebreak is triggered
set wrap " same as linebreak but uses terminal width
set updatetime=50
set colorcolumn=80
autocmd BufWritePre * %s/\s\+$//e " Clears trailing Whitespace on save.
set incsearch
set noswapfile nobackup
set foldenable foldmethod=syntax
set hidden " To use buffers without having to write to file
" set cursorline cursorcolumn " Sets crossairs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Load Plugins:
call plug#begin()
" Themes:
Plug 'chriskempson/base16-vim'
Plug 'preservim/nerdtree'
" Plug 'tomasiser/vim-code-dark'
" Assthetic:
Plug 'ap/vim-buftabline'
Plug 'sheerun/vim-polyglot'
" Functional:
Plug 'tpope/vim-commentary'
Plug 'jremmen/vim-ripgrep'
" Plug 'junegunn/fzf.vim'
call plug#end()
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colorscheme:
set background=dark
set termguicolors " Tell vim to use truecolor support
colorscheme base16-classic-dark
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autocomplete Related:
set wildmenu " The nice tab completions at the command
set wildmode=full
set ignorecase " Ignore case sensitivity when searching
set smartcase " Tries to be smart about searching
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fileype Specific:
autocmd VimLeave *.tex !texclear %
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indentation:
set autoindent
set shiftwidth=0
" Hard Tabs:
set tabstop=4
" Soft Tabs:
" set expandtab
" set softtabstop=4
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree:
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeQuitOnOpen = 1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keybinds:

" Vim Plus Ctags Is God:
" ^n: auto-complete
" ^p: reverse auto-complete
" ^]: go-to definition
" ^t: reverse go-to definition
command! MakeTags !ctags -R .
noremap <leader>cc :MakeTags<CR><CR>

noremap <leader>lc :update<CR> :!compiler <c-r>%<CR>
noremap <leader>lp :!opout <c-r>%<CR><CR>

" Plugin:
noremap <silent><leader>vs :vs<CR>
noremap <silent><leader>ps :Rg<SPACE>
noremap <silent><m-p> :NERDTreeToggleVCS<CR> :vertical resize 15<CR>
noremap <silent><C-p> :FZF<CR>

" Window Management:
noremap  <silent><C-c>  	:wincmd c<CR>
noremap  <silent><leader>h 	:wincmd h<CR>
noremap  <silent><leader>l	:wincmd l<CR>
noremap  <silent><leader>j 	:wincmd j<CR>
noremap  <silent><leader>k   	:wincmd k<CR>
nnoremap <silent><C-h> 	:vertical resize +2<CR>
nnoremap <silent><C-l> 	:vertical resize -2<CR>
nnoremap <silent><C-j> 	:resize +2<CR>
nnoremap <silent><C-k> 	:resize -2<CR>

" Clears The Last Search:
nnoremap <silent><nowait> <leader><esc> :let @/ = ""<CR>

" Reindent File:
noremap <leader>i gg=G<C-o>

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
" noremap <leader><CR> :split term://zsh<CR> :resize 15<CR>a
noremap <leader><CR> :vertical split term://zsh<CR>a
tnoremap <Esc> <C-\><C-n>
tnoremap <m-q> <C-\><C-n>:bd!<CR>

" Better Wrapping:
noremap <expr> G &wrap ? "G$g0" : "G"
noremap <expr> 0 &wrap ? 'g0' : '0'
noremap <expr> $ &wrap ? "g$" : "$"
noremap <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <expr> k (v:count == 0 ? 'gk' : 'k')
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Statusline:
set laststatus=2
set statusline=\ %F\ [%M%R%H%W%Y][%{&ff}]\ %=\ line:%l/%L\ col:%c\ \ %p%%
let g:buftabline_show = 2
let g:buftabline_numbers = 0
let g:buftabline_indicators = 1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

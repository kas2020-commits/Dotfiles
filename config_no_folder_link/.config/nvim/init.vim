" Global Rules:
syntax on
filetype plugin indent on
let mapleader =" "
set mouse=a " Mouse features set to all
set encoding=utf-8
set spelllang=en_us
set ruler " Always show cursor location on bottom-right
set scrolloff=2 " how many lines does the cursor need as cushion space
set clipboard=unnamedplus
set splitbelow splitright " set splitting to be more normal:
set termguicolors " Tell vim to use truecolor support
set linebreak " Makes line wrapping better
set textwidth=80 " Max line width before linebreak is triggered
set wrap " same as linebreak but uses terminal width
set updatetime=50
set colorcolumn=80
autocmd BufWritePre * %s/\s\+$//e " Clears trailing Whitespace on save.
set incsearch
set noswapfile
set nobackup
set foldenable
set foldmethod=syntax
set hidden " To use buffers without having to write to file
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Load Plugins:
call plug#begin()
" Themes:
Plug 'gruvbox-community/gruvbox'
" Plug 'nanotech/jellybeans.vim'
" Plug 'joshdick/onedark.vim'
" Plug 'arcticicestudio/nord-vim'
" Plug 'lifepillar/vim-solarized8'
" Assthetic:
Plug 'ap/vim-buftabline'
Plug 'sheerun/vim-polyglot'
" Functional:
Plug 'tpope/vim-commentary'
Plug 'jremmen/vim-ripgrep'
Plug 'junegunn/fzf.vim'
call plug#end()
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colorscheme:
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_invert_selection=1
let g:gruvbox_italic=1
let g:gruvbox_improved_warnings=1

set background=dark
colorscheme gruvbox
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
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keybinds:

" Plugin:
noremap <silent> <leader>vs :vs<CR>
noremap <silent> <leader>ps :Rg<SPACE>
noremap <m-p> :FZF<CR>

" Window Management:
noremap  <silent> <C-c> 	:wincmd c<CR>
noremap  <silent> <C-h>     :wincmd h<CR>
noremap  <silent> <C-j>     :wincmd j<CR>
noremap  <silent> <C-k>     :wincmd k<CR>
noremap  <silent> <C-l>     :wincmd l<CR>
nnoremap <silent> <Left>    :vertical resize +2<CR>
nnoremap <silent> <Right>   :vertical resize -2<CR>
nnoremap <silent> <Down>    :resize +2<CR>
nnoremap <silent> <Up>	    :resize -2<CR>

" Clears The Last Search:
nnoremap <silent><nowait> <leader><esc> :let @/ = ""<CR>

" Reindent File:
noremap <leader>i gg=G<C-o>

" Buffer Management:
noremap <silent> <m-q> :bdelete<CR>
noremap <silent> <m-l> :bnext<CR>
noremap <silent> <m-h> :bprev<CR>

" Misc:
nnoremap Y y$
noremap <m-k> <C-u>
noremap <m-j> <C-d>
noremap <leader>o :setlocal spell! spelllang=en_us<CR>
noremap <silent> W :update<CR>
noremap Q :q<CR>

" Terminal:
noremap <leader><CR> :split term://zsh<CR> :resize 15<CR>a
tnoremap <Esc> <C-\><C-n>
tnoremap <m-q> <C-\><C-n>:bd!<CR>
tnoremap <C-d> <C-\><C-n>:bd!<CR>

" Outside Scripts:
noremap <leader>sc :w! \| !compiler <c-r>%<CR>
noremap <leader>sp :!opout <c-r>%<CR><CR>

" Better Wrapping:
noremap <expr> G &wrap ? "G$g0" : "G"
noremap <expr> 0 &wrap ? 'g0' : '0'
noremap <expr> $ &wrap ? "g$" : "$"
noremap <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <expr> k (v:count == 0 ? 'gk' : 'k')
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Statusline:
set laststatus=2
set statusline=
set statusline+=\ %F\ [%M%R%H%W%Y][%{&ff}]
set statusline+=\ %=\ line:%l/%L\ col:%c
set statusline+=\ \ %p%%
let g:buftabline_show = 2
let g:buftabline_numbers = 0
let g:buftabline_indicators = 1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Soft Tabs:
" set expandtab
" set softtabstop=4

" Dead Settings:
" set cursorline cursorcolumn " Sets crossairs

" Coc Related:

" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

" auto highlights the word the cursor is on based on lsp.
" autocmd CursorHold * silent call CocActionAsync('highlight')

" " Coc Bindings:
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<TAB>" : coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" nnoremap <silent><nowait> <leader>ca  :<C-u>CocList diagnostics<cr>
" nnoremap <silent><nowait> <leader>ce  :<C-u>CocList extensions<cr>
" nnoremap <silent><nowait> <leader>cc  :<C-u>CocCommand<cr>
" nnoremap <silent><nowait> <leader>ch  :CocCommand clangd.switchSourceHeader<cr>
" nmap <silent> <leader>gd <Plug>(coc-definition)
" nmap <silent> <leader>gi <Plug>(coc-implementation)
" nmap <silent> <leader>gr <Plug>(coc-references)
" nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

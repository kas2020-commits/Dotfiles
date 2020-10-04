" Load Plugins:
call plug#begin()
Plug 'morhetz/gruvbox'
Plug 'preservim/nerdtree'
Plug 'ap/vim-buftabline'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
" Plug 'junegunn/fzf.vim'
Plug 'neovim/nvim-lspconfig'
call plug#end()
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Never Touch:
set encoding=utf-8 spelllang=en_us
set termguicolors
set mouse=a
set clipboard=unnamedplus
set splitbelow splitright
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Native Settings:
let mapleader =" "
set scrolloff=2 " how many lines does the cursor need as cushion space
set linebreak " Wrap uses terminal width; linebreak uses specified width
set updatetime=50
set textwidth=80 " Max line width before linebreak is triggered
set colorcolumn=80
set incsearch " Incremental search when using /
set foldenable foldmethod=syntax
set noet ci pi sts=0 sw=2 ts=2 " Settings for tabs
set wildmenu wildmode=full ignorecase smartcase " Settings for ':'
set laststatus=1 " disables the statusline when only 1 window tab being used
set noswapfile autowrite " Settings for writing to disk
set titlestring=%t title " sets the title of the terminal to be the filename
set list " This will list out certain characters like tabs or newline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pluggin Settings:
let g:buftabline_indicators=1
let g:gruvbox_italic=1
let g:gruvbox_inverse=1
let g:gruvbox_bold=1
let g:gruvbox_contrast_dark = 'medium'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Initialize Plugins:
colorscheme gruvbox

" To get autocomplete add this in the brackets:
" on_attach=require'completion'.on_attach
" Also, for rust_analyzer, you could also use rls instead
lua <<EOF
require'nvim_lsp'.clangd.setup{}
require'nvim_lsp'.rls.setup{}
EOF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autocommands:
autocmd BufWinLeave,VimLeave *.tex !texclear %
autocmd BufWritePre * %s/\s\+$//e " Clears trailing Whitespace on save.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keybinds:
nnoremap K :lua vim.lsp.buf.hover()<CR>
nnoremap <C-]> :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>vsh :lua vim.lsp.buf.signature_help()<CR>
nnoremap <leader>vrr :lua vim.lsp.buf.references()<CR>
nnoremap <leader>vrn :lua vim.lsp.buf.rename()<CR>
nnoremap <leader>vca :lua vim.lsp.buf.code_action()<CR>
" Leader:
noremap <leader>o  :setlocal spell! spelllang=en_us<CR>
noremap <leader>lc :update<CR>:!compiler <c-r>%<CR>
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
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
" Terminal:
noremap  <leader><CR> :split term://zsh<CR> :resize 15<CR>a
tnoremap <Esc> <C-\><C-n>
tnoremap <m-q> <C-\><C-n>:bd!<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

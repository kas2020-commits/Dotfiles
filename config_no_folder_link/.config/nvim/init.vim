"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Load Plugins:
call plug#begin()
Plug 'morhetz/gruvbox'
Plug 'ap/vim-buftabline'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf.vim'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
call plug#end()
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Setters:
set encoding=utf-8 spelllang=en_us
set termguicolors
set mouse=a
set clipboard=unnamedplus
set splitbelow splitright
set scrolloff=4 " how many lines does the cursor need as cushion space
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
set noshowmode
set completeopt=menuone,noinsert,noselect
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Misc:
let mapleader =" "
autocmd BufWritePre * %s/\s\+$//e " Clears trailing Whitespace on save.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pluggin Settings:
let g:buftabline_indicators=1
let g:gruvbox_italic=1
let g:gruvbox_inverse=1
let g:gruvbox_bold=1
let g:gruvbox_contrast_dark = 'medium'
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Initialize Plugins:
colorscheme gruvbox

" To get autocomplete add this in the brackets:
" on_attach=require'completion'.on_attach
" Also, for rust_analyzer, you could also use rls instead
lua <<EOF
require'nvim_lsp'.clangd.setup{ on_attach=require'completion'.on_attach }
require'nvim_lsp'.rls.setup{ on_attach=require'completion'.on_attach }
EOF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Language Server Protocol Commands:
nnoremap <silent> K            <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <C-k>        <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD          <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> <C-]>        <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> <leader>gr   <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> <leader>gd   <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <leader>vrn  <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> <leader>vca  <cmd>lua vim.lsp.buf.code_action()<CR>
" Leader:
nnoremap <silent> <leader><CR>  <cmd>split term://zsh<CR> <cmd>resize 15<CR>a
nnoremap <silent> <leader><esc> <cmd>let @/ = ""<CR>
nnoremap <silent> <leader>i     gg=G
nnoremap <silent> <leader>o     <cmd>setlocal spell! spelllang=en_us<CR>
nnoremap <silent> <leader>c     <cmd>update<CR><cmd>!compiler <c-r>%<CR>
nnoremap <silent> <leader>p     <cmd>!opout %<CR><CR>
nnoremap <silent> <leader>s     <cmd>vs<CR>
nnoremap <silent> <leader>l     <cmd>wincmd l<CR>
nnoremap <silent> <leader>h     <cmd>wincmd h<CR>
nnoremap <silent> <leader>j     <cmd>wincmd j<CR>
nnoremap <silent> <leader>k     <cmd>wincmd k<CR>
" Control:
nnoremap <silent> <C-h>  <cmd>vertical resize +2<CR>
nnoremap <silent> <C-l>  <cmd>vertical resize -2<CR>
nnoremap <silent> <C-j>  <cmd>resize -2<CR>
nnoremap <silent> <C-k>  <cmd>resize +2<CR>
" Alt:
nnoremap <m-q> <cmd>bdelete<CR>
nnoremap <m-l> <cmd>bnext<CR>
nnoremap <m-h> <cmd>bprev<CR>
nnoremap <m-k> <C-u>
nnoremap <m-j> <C-d>
nnoremap <m-p> <cmd>FZF<CR>
" UpperCase:
nnoremap Y y$
nnoremap W <cmd>update<CR>
nnoremap Q <cmd>q<CR>
vnoremap J <cmd>m '>+1<CR>gv=gv
vnoremap K <cmd>m '<-2<CR>gv=gv
" Terminal:
tnoremap <Esc> <C-\><C-n>
tnoremap <m-q> <C-\><C-n><cmd>bd!<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

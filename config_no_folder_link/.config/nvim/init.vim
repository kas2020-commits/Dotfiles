"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Load Plugins:
call plug#begin()
Plug 'lifepillar/vim-gruvbox8'  " colorscheme
Plug 'ap/vim-buftabline'        " cosmetic view of tabs
Plug 'sheerun/vim-polyglot'     " syntax highlighting
Plug 'tpope/vim-commentary'     " universal auto-commenting
Plug 'junegunn/fzf.vim'         " fzf bindings
Plug 'tpope/vim-endwise'        " auto close name braces
Plug '9mm/vim-closer'           " auto close braces
Plug 'neovim/nvim-lspconfig'    " the IDE part
" Plug 'nvim-lua/completion-nvim' " autocompletion
call plug#end()
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Setters:
set encoding=utf-8 spelllang=en_us
set termguicolors
set mouse=a
set clipboard=unnamedplus
set splitbelow splitright
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
set autowrite " Settings for writing to disk
set titlestring=%t title " sets the title of the terminal to be the filename
set list " This will list out certain characters like tabs or newline
set completeopt=menuone,noinsert,noselect
set number relativenumber
" set guicursor=v-c:block,i-ci-ve:ver25,n-r-cr-o:hor20
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Misc:
let mapleader =" "
autocmd BufWritePre * %s/\s\+$//e " Clears trailing Whitespace on save.
autocmd VimLeave * !texclear
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pluggin Settings:
let g:buftabline_indicators=1
let g:gruvbox_inverse=1
let g:gruvbox_bold=1
let g:gruvbox_transp_bg = 1
let g:gruvbox_plugin_hi_groups = 1
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Initialize Plugins:
colorscheme gruvbox8

" For rust_analyzer, you could also use rls instead
:lua << EOF
	local lspconfig = require('lspconfig')
	local on_attach = function(_, bufnr)
		--(delete me to uncomment) require('completion').on_attatch()
	end
	local servers = {'clangd', 'rls'}
	for _, lsp in ipairs(servers) do
		lspconfig[lsp].setup {
		on_attach = on_attach,
		}
	end
EOF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LSP Commands:
nnoremap <silent> <leader>gD <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> <leader>gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> <leader>gd <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <leader>gn <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> <leader>ga <cmd>lua vim.lsp.buf.code_action()<CR>
" Leader:
nnoremap <silent> <leader><CR> <cmd>split term://zsh<CR> <cmd>resize 15<CR>a
nnoremap <silent> <leader>i    gg=G
nnoremap <silent> <leader>o    <cmd>setlocal spell! spelllang=en_us<CR>
nnoremap <silent> <leader>c    <cmd>update<CR>:!compiler <c-r>%<CR>
nnoremap <silent> <leader>p    <cmd>!opout %<CR><CR>
nnoremap <silent> <leader>s    <cmd>vs<CR>
nnoremap <silent> <leader>l    <cmd>wincmd l<CR>
nnoremap <silent> <leader>h    <cmd>wincmd h<CR>
nnoremap <silent> <leader>j    <cmd>wincmd j<CR>
nnoremap <silent> <leader>k    <cmd>wincmd k<CR>
" Control:
noremap <silent> <C-q> <cmd>bdelete<CR>
noremap <silent> <C-c> <cmd>close<CR>
noremap <silent> <C-]> <cmd>lua vim.lsp.buf.definition()<CR>
noremap <silent> <C-h> <cmd>vertical resize +2<CR>
noremap <silent> <C-l> <cmd>vertical resize -2<CR>
noremap <silent> <C-j> <cmd>resize -2<CR>
noremap <silent> <C-k> <cmd>resize +2<CR>
" Alt:
noremap <silent> <m-l> <cmd>bnext<CR>
noremap <silent> <m-h> <cmd>bprev<CR>
noremap <silent> <m-k> <C-u>
noremap <silent> <m-j> <C-d>
noremap <silent> <m-p> <cmd>FZF<CR>
" UpperCase:
nnoremap Y y$
nnoremap W <cmd>update<CR>
nnoremap K <cmd>lua vim.lsp.buf.hover()<CR>
" Terminal:
tnoremap <Esc> <C-\><C-n>
tnoremap <m-q> <C-\><C-n><cmd>bd!<CR>
" Misc:
nnoremap <esc> <cmd>let @/ = ""<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Global Rules:
    set nocompatible "sets no compatible to vi-mode
    syntax on
    filetype plugin indent on
    let mapleader =" "
    set isfname-=$,=
	set number relativenumber
    set mouse=a " Mouse features set to all
    set encoding=utf-8
    set spelllang=en_us
    set cursorline " Changes the line the cursor is on
	set cursorcolumn "
    set ruler " Always show cursor location on bottom-right
    set scrolloff=4 " how many lines does the cursor need as cushion space
    set clipboard=unnamedplus
    set splitbelow splitright " set splitting to be more normal:
    set termguicolors " Tell vim to use truecolor support
    set linebreak " Makes line wrapping better
    set textwidth=80 " Max line width before linebreak is triggered
    set nowrap " same as linebreak but uses terminal width
    set updatetime=50
    set colorcolumn=80
    autocmd BufWritePre * %s/\s\+$//e " Clears trailing Whitespace on save.
    set autochdir
	set incsearch
	" set guicursor=i:hor2
	set guicursor=
	set noswapfile
	set nobackup
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Load Plugins:
    call plug#begin()
        " Themes:
            " Plug 'gruvbox-community/gruvbox'
			Plug 'dracula/vim'
			" Plug 'arcticicestudio/nord-vim'
        " Assthetic:
			Plug 'norcalli/nvim-colorizer.lua'
            Plug 'ap/vim-buftabline'
			Plug 'sheerun/vim-polyglot'
        " Functional:
            Plug 'tpope/vim-commentary'
			Plug 'mbbill/undotree'
			Plug 'neoclide/coc.nvim'
			Plug 'junegunn/fzf.vim'
			Plug 'jremmen/vim-ripgrep'
			Plug 'rust-lang/rust.vim'
    call plug#end()
	lua require'colorizer'.setup()
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colorscheme:
	" let g:gruvbox_contrast_dark='hard'
	" let g:gruvbox_invert_selection='0'

	" if exists('+termguicolors')
    	" let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    	" let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
	" endif
	" set background=dark
	" colorscheme gruvbox
	colorscheme dracula
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Coc Related:
"
	function! s:check_back_space() abort
		let col = col('.') - 1
		return !col || getline('.')[col - 1]  =~# '\s'
	endfunction

	" auto highlights the word the cursor is on based on lsp.
	autocmd CursorHold * silent call CocActionAsync('highlight')
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autocomplete Related:
    set wildmenu " The nice tab completions at the command
	set wildmode=full
    set ignorecase " Ignore case sensitivity when searching
    set smartcase " Tries to be smart about searching
    set hidden
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fileype Specific:
    autocmd BufWritePost *Xresources !xrdb %
    autocmd BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
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
" Keybinds:
	" Coc:
	inoremap <silent><expr> <TAB>
    	  \ pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<TAB>" : coc#refresh()
	inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
	nnoremap <silent><nowait> <leader>ca  :<C-u>CocList diagnostics<cr>
	nnoremap <silent><nowait> <leader>ce  :<C-u>CocList extensions<cr>
	nnoremap <silent><nowait> <leader>cc  :<C-u>CocCommand<cr>
	nnoremap <silent><nowait> <leader>ch  :CocCommand clangd.switchSourceHeader<cr>

	" Plugin:
	noremap <silent> <leader>uu :UndotreeToggle<CR>
	noremap <silent> <leader>vs :vs<CR>
	noremap <silent> <leader>ps :Rg<SPACE>
	noremap <leader><CR> :term<CR>a
	noremap <m-p> :FZF<CR>

	" Godly Ripgrep Search:
	nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>
	nnoremap <leader>pw :Rg <C-R>=expand("<cword>")<CR><CR>

	" GoTo Code Navigation:
	nmap <silent> <leader>gd <Plug>(coc-definition)
	nmap <silent> <leader>gy <Plug>(coc-type-definition)
	nmap <silent> <leader>gi <Plug>(coc-implementation)
	nmap <silent> <leader>gr <Plug>(coc-references)
	nnoremap <buffer> <leader>cr :CocRestart<CR>

	" Window Management:
	nnoremap <C-c> <nop>
	nnoremap <C-h> <nop>
	nnoremap <C-j> <nop>
	nnoremap <C-k> <nop>
	nnoremap <C-l> <nop>
	noremap  <silent> <C-c> :wincmd c<CR>
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
	nnoremap Q <nop>
	nnoremap Q :q<CR>
    noremap <leader>w :w!<CR>
    noremap <leader>o :setlocal spell! spelllang=en_us<CR>

	" Shift Text:
	xnoremap K :move '<-2<CR>gv-gv
	xnoremap J :move '>+1<CR>gv-gv

	" Terminal:
	tnoremap <Esc> <C-\><C-n>
	tnoremap <m-q> <C-\><C-n>:bd!<CR>

	" Outside Scripts:
    noremap <leader>sc :w! \| !compiler <c-r>%<CR>
    noremap <leader>sp :!opout <c-r>%<CR><CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Statusline:
    set laststatus=1
	set statusline=
    set statusline+=\ %F\ [%M%R%H%W%Y][%{&ff}]
	set statusline+=\ %=\ line:%l/%L\ col:%c
	set statusline+=\ \ %p%%

" Plugin Settings:
	" Buftabline:
	let g:buftabline_show = 2
    let g:buftabline_numbers = 0
    let g:buftabline_indicators = 2

" FZF:
	let g:fzf_layout = { 'window' : { 'width': 0.8, 'height': 0.8 } }
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

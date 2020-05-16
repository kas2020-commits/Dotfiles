" Global Rules:
        set nocompatible "sets no compatible to vi-mode
        syntax on
        let mapleader =" "
        set isfname-=$,=
        set number relativenumber
        set mouse=a " Mouse features set to all
        set encoding=utf-8
        set spelllang=en_us
        set cursorline " Changes the line the cursor is on
        set ruler " Always show cursor location on bottom-right
        set scrolloff=5 " how many lines does the cursor need as cushion space
        set clipboard=unnamedplus
        set splitbelow splitright " set splitting to be more normal:
        set termguicolors " Tell vim to use truecolor support
		" set t_Co=256
        set linebreak " Makes line wrapping better
        set textwidth=80 " Max line width before linebreak is triggered
        set wrap " same as linebreak but uses terminal width
        set updatetime=50
        set colorcolumn=80
        autocmd BufWritePre * %s/\s\+$//e " Clears trailing Whitespace on save.
        set autochdir
		set incsearch
		set guicursor=a:block
		set guicursor+=a:blinkon0
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Load Plugins:
        call plug#begin()
            " Themes:
                Plug 'gruvbox-community/gruvbox'
				" Plug 'arcticicestudio/nord-vim'
            " Assthetic:
				Plug 'norcalli/nvim-colorizer.lua'
                Plug 'ap/vim-buftabline'
            " Functional:
                Plug 'tpope/vim-commentary'
				Plug 'mbbill/undotree'
        call plug#end()
		lua require'colorizer'.setup()
		let g:gruvbox_contrast_dark='hard'
		set background=dark
        colorscheme gruvbox
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autocomplete Related:
        set wildmenu " The nice tab completions at the command
		set wildmode=full
        set ignorecase " Ignore case sensitivity when searching
        set smartcase " Tries to be smart about searching
        set hidden
		set wildignore+=**/node_modules/**
		set wildignore+=*.o
		set path+=~/.config
		set path+=~/.local/bin
		set path+=~/.local/github
		set path-=~/Downloads
        set path+=** " adds all files in your project folder to the path
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fileype Specific:
        autocmd BufWritePost *Xresources !xrdb %
		autocmd BufWritePost init.vim source %
        autocmd BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indentation:
        filetype plugin indent on
        set autoindent
        set shiftwidth=0
    " Hard Tabs:
        set tabstop=4
    " Soft Tabs:
        " set expandtab
        " set softtabstop=4
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keybinds:
		" Plugin:
		noremap <silent> <leader>u :UndotreeToggle<CR>
		noremap <leader><CR> :term<CR>a
		noremap <m-Space> :find<Space>
		noremap <m-p> :Ex<CR>
		nnoremap <leader>. :Files ~/.config<CR>
		" Window Management:
		noremap <silent> <leader>c :wincmd c<CR>
		noremap <silent> <leader>h :wincmd h<CR>
		noremap <silent> <leader>j :wincmd j<CR>
		noremap <silent> <leader>k :wincmd k<CR>
		noremap <silent> <leader>l :wincmd l<CR>
		nnoremap <silent> <Left>  :vertical resize +2<CR>
		nnoremap <silent> <Right> :vertical resize -2<CR>
		nnoremap <silent> <Down>  :resize +2<CR>
		nnoremap <silent> <Up>	  :resize -2<CR>
        " Clears The Last Search:
        nnoremap <leader><esc> :let @/ = ""<CR>
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
        map <leader>c :w! \| !compiler <c-r>%<CR>
        noremap <leader>p :!opout <c-r>%<CR><CR>
        autocmd VimLeave *.tex !texclear %
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Statusline:
        set laststatus=1
		set statusline=
        set statusline+=%f\ \ \ [%M%R%H%W%Y][%{&ff}]\ \ %=\ line:%l/%L\ col:%c
		set statusline+=\ \ %p%%
		let g:buftabline_show = 2
        let g:buftabline_numbers = 0
        let g:buftabline_indicators = 2
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Netrw:
		let g:netrw_banner = 0
		let g:netrw_browse_split = 0
		" let g:netrw_liststyle = 1

if has("gui_running")
	set guioptions-=m guioptions-=l guioptions-=T guioptions-=r
	set guifont=Fira\ Code\ Medium\ 14
endif

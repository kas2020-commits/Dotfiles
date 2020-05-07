"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Global Rules:
        set nocompatible "sets no compatible to vi-mode
        syntax on
        let mapleader =" "
        set isfname-=$,=
        " set number relativenumber
        set mouse=a " Mouse features set to all
        set encoding=utf-8
        set spelllang=en_us
        set cursorline " Changes the line the cursor is on
        set ruler " Always show cursor location on bottom-right
        set scrolloff=5 " how many lines does the cursor need as cushion space
        let c_comment_strings=1
        set clipboard=unnamedplus
        set splitbelow splitright " set splitting to be more normal:
        set lazyredraw " Good for performance when using macros
        set showmatch " More search stuff
        set termguicolors " Tell vim to use truecolor support
        set linebreak " Makes line wrapping better
        set textwidth=80 " Max line width before linebreak is triggered
        set wrap " same as linebreak but uses terminal width
        set updatetime=50
        set colorcolumn=80
        autocmd BufWritePre * %s/\s\+$//e " Clears trailing Whitespace on save.
        set autochdir
		set incsearch
        set path+=** " adds all files in your project folder to the path
		" set noshowmode
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Load Plugins:
        call plug#begin()
            " Themes:
                " Plug 'joshdick/onedark.vim'
                Plug 'gruvbox-community/gruvbox'
			" The Pope:
				" Plug 'tpope/vim-fugitive'
                Plug 'tpope/vim-commentary'
				Plug 'tpope/vim-vinegar'
            " Assthetic:
                " Plug 'itchyny/lightline.vim'
                Plug 'norcalli/nvim-colorizer.lua'
                Plug 'ap/vim-buftabline'
            " Other:
                " Plug 'jreybert/vimagit'
                Plug 'kien/ctrlp.vim'
				Plug 'mbbill/undotree'
        call plug#end()
        lua require'colorizer'.setup()
        set background=dark
        colorscheme gruvbox
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autocomplete Related:
        set wildmenu " The nice tab completions at the command
        set ignorecase " Ignore case sensitivity when searching
        set smartcase " Tries to be smart about searching
        set hidden
		set wildignore+=**/node_modules/**
		set wildignore+=/home/kar/.local/share
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fileype Specific:
        autocmd BufWritePost *Xresources !xrdb %
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
		noremap <leader>u :UndotreeToggle<CR>
		noremap <leader><CR> :term<CR>a
		noremap <m-p> :CtrlPBookmarkDir<CR>
        " Write To Disk:
        noremap <leader>w :w!<CR>
        " Set Spellcheck:
        noremap <leader>o :setlocal spell! spelllang=en_us<CR>
        " Navigation:
        noremap <leader>e :Lex! <bar> :vertical resize 30<CR>
		" Window Management:
		noremap <C-c> :wincmd c<CR>
		noremap <C-h> :wincmd h<CR>
		noremap <C-j> :wincmd j<CR>
		noremap <C-k> :wincmd k<CR>
		noremap <C-l> :wincmd l<CR>
		nnoremap <silent> <leader>+ :vertical resize +10<CR>
		nnoremap <silent> <leader>- :vertical resize -10<CR>
        " Clears The Last Search:
        nnoremap <leader><esc> :let @/ = ""<CR>
        " Reindent File:
        noremap <leader>i gg=G<C-o>
        " Buffer Management:
        noremap <leader>q  :bdelete<CR>
        noremap <leader>l  :bnext<CR>
        noremap <leader>h  :bprev<CR>
        " Misc:
        nnoremap Y y$
        noremap <m-k> <C-u>
        noremap <m-j> <C-d>
		nnoremap Q <nop>
		" Move:
		xnoremap K :move '<-2<CR>gv-gv
		xnoremap J :move '>+1<CR>gv-gv
        " Buffer Movement:
        nmap <leader>1 <Plug>BufTabLine.Go(1)
        nmap <leader>2 <Plug>BufTabLine.Go(2)
        nmap <leader>3 <Plug>BufTabLine.Go(3)
        nmap <leader>4 <Plug>BufTabLine.Go(4)
        nmap <leader>5 <Plug>BufTabLine.Go(5)
        nmap <leader>6 <Plug>BufTabLine.Go(6)
        nmap <leader>7 <Plug>BufTabLine.Go(7)
        nmap <leader>8 <Plug>BufTabLine.Go(8)
        nmap <leader>9 <Plug>BufTabLine.Go(9)
        nmap <leader>0 <Plug>BufTabLine.Go(-1)
		" Terminal:
		tnoremap <Esc> <C-\><C-n>
		tnoremap <m-q> <C-\><C-n>:bd!<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Outside Scripts:
        " noremap <leader>cl :w! \| !pdflatex % ./ <CR><CR>
        map <leader>c :w! \| !compiler <c-r>%<CR>
        noremap <leader>p :!opout <c-r>%<CR><CR>
        autocmd VimLeave *.tex !texclear %
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Statusline: (set laststatus to 2 to always see the statusline)
        set showtabline=1
        set laststatus=1
        " set statusline=\%<%F\ \ \ [%M%R%H%W%Y][%{&ff}]\ \ %=\ line:%l/%L\ col:%c\ \ \ %p%%
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Customization:
		" let g:startify_bookmarks = [ {'v': '~/.config/nvim/init.vim'}, {'z': '~/.config/zsh/.zshrc'}, {'g': '~/.local/github'} ]
		" let g:startify_custom_header =
                                " \ [
                                " \ '     _   __                _         ',
                                " \ '    / | / /__  ____ _   __(_)___ ___ ',
                                " \ '   /  |/ / _ \/ __ \ | / / / __ `__ \',
                                " \ '  / /|  /  __/ /_/ / |/ / / / / / / /',
                                " \ ' /_/ |_/\___/\____/|___/_/_/ /_/ /_/ ',
                                " \ ]
        " " let g:startify_change_to_dir = 0
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
		let g:buftabline_show = 2
        let g:buftabline_numbers = 2
        let g:buftabline_indicators = 1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Gvim Customization:
if has('gui_running')
    set guioptions-=T  " no toolbar
    set guioptions-=r
    set guioptions-=m
    set guioptions-=L
    set guiheadroom=0
    set guifont=Fira\ Code\ Medium\ 13
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

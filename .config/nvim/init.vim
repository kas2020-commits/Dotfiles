"        _
" __   _(_)_ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
"   \_/ |_|_| |_| |_|_|  \___|

" Global Rules:
	set nocompatible "sets no compatible to vi-mode
	syntax on
	let mapleader =" "
        set isfname-=$,=
        set nohlsearch " Search highlight turned off
        set number relativenumber
        set mouse=a " Mouse features set to all
	set encoding=utf-8
        set spelllang=en_us
        set cursorline " Changes the line the cursor is on
	set ruler " Always show cursor location on bottom-right
	set scrolloff=5 " how many lines does the cursor need as cushion space
	let c_comment_strings=1
        set clipboard+=unnamedplus " tell vim to use main clipboard
	set splitbelow splitright " set splitting to be more normal:
 	set lazyredraw " Good for performance when using macros
	set showmatch " More search stuff
        " set t_Co=256
        set termguicolors " Tell vim to use truecolor support
	set linebreak " Makes line wrapping better
	set textwidth=80 " Max line width before linebreak is triggered
	set wrap " same as linebreak but uses terminal width
        set updatetime=50
        set colorcolumn=80
	autocmd BufWritePre * %s/\s\+$//e " Clears trailing Whitespace on save.
        set noshowmode

" Load Plugins:
        call plug#begin()
                " Plug 'gruvbox-community/gruvbox'
                " Plug 'kien/ctrlp.vim'
                Plug 'itchyny/lightline.vim'
                Plug 'joshdick/onedark.vim'
                Plug 'mhinz/vim-startify'
                Plug 'norcalli/nvim-colorizer.lua'
                Plug 'ap/vim-buftabline'
                Plug 'tpope/vim-commentary'
                Plug 'mcchrish/nnn.vim'
        call plug#end()
        lua require'colorizer'.setup()
        set background=dark
        colorscheme onedark

" Autocomplete Related:
	set wildmenu " The nice tab completions at the command
	set ignorecase " Ignore case sensitivity when searching
	set smartcase " Tries to be smart about searching
        set path+=** " adds all files in your project folder to the path
        set hidden
        set wildignore+=**/node_modules/**

" Fileype Specific:
        autocmd BufWritePost *Xresources !xrdb %
        autocmd BufNewFile,BufFilePre,BufRead *.md set filetype=markdown

" Indentation:
        filetype plugin indent on
        set autoindent
        set expandtab
        set shiftwidth=8
        set softtabstop=8

" Keybinds:
	" Write To Disk:
        noremap <leader>q :q<CR>
	noremap <leader>w :w!<CR>
	" Set Spellcheck:
	noremap <leader>o :setlocal spell! spelllang=en_us<CR>
	" Navigation:
        " splits
        noremap <C-h> <C-w>h
        noremap <C-j> <C-w>j
        noremap <C-k> <C-w>k
        noremap <C-l> <C-w>l
        " up/down a file
        noremap <m-k> <C-u>
        noremap <m-j> <C-d>
        " between buffers
        noremap <m-l> :bnext<CR>
        noremap <m-h> :bprev<CR>
        " Reindent File:
        noremap <leader>i gg=G<C-o>
        " Clears The Last Search:
        nnoremap <leader><esc> :let @/ = ""<CR>
        " Buffer Management:
        noremap <leader><leader> :Startify<CR>
        noremap <leader>bd :bdelete<CR>
        noremap <leader>bq :bufdo bd \| Startify<CR>
        " Misc:
        nnoremap Y y$

" Outside Scripts:
        noremap <leader>cl :w! \| !pdflatex % ./ <CR><CR>
	noremap <leader>p :!opout <c-r>%<CR><CR>
        autocmd VimLeave *.tex !texclear %

" Statusline: (set laststatus to 2 to always see the statusline)
        set showtabline=0
        set laststatus=2
	set statusline=\%<%F\ \ \ [%M%R%H%W%Y][%{&ff}]\ \ %=\ line:%l/%L\ col:%c\ \ \ %p%%

" Functions:
function! TwiddleCase(str)
        if a:str ==# toupper(a:str)
                let result = tolower(a:str)
        elseif a:str ==# tolower(a:str)
                let result = substitute(a:str,'\(\<\w\+\>\)', '\u\1', 'g')
        else
                let result = toupper(a:str)
        endif
        return result
endfunction

" Function Mappings:
vnoremap ~ y:call setreg('', TwiddleCase(@"), getregtype(''))<CR>gv""Pgv

" Plugin Customization:
        let g:nnn#set_default_mappings = 0
        nnoremap <silent> <leader>n :NnnPicker<CR>
        let g:lightline = {
                \ 'colorscheme': 'onedark',
                \ }
        let g:startify_custom_header =
                                \ [
                                \ '     _   __                _         ',
                                \ '    / | / /__  ____ _   __(_)___ ___ ',
                                \ '   /  |/ / _ \/ __ \ | / / / __ `__ \',
                                \ '  / /|  /  __/ /_/ / |/ / / / / / / /',
                                \ ' /_/ |_/\___/\____/|___/_/_/ /_/ /_/ ',
                                \ ]
        " let g:startify_change_to_dir = 0

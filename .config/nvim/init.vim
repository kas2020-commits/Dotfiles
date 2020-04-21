"        _
" __   _(_)_ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
"   \_/ |_|_| |_| |_|_|  \___|

" Global Rules:
	set nocompatible "sets no compatible to vi-mode
	let mapleader =" "
	syntax on
	colorscheme peachpuff
        " Change cterm=NONE to to cterm=bold if you like
        highlight CursorLine ctermbg=0 cterm=NONE
        " highlight CursorColumn ctermbg=0 cterm=NONE
        set mouse=a
	set encoding=utf-8
        set spelllang=en_us
        set cursorline " Changes the line the cursor is on
        " set cursorcolumn
	set ruler " Always show cursor location on bottom-right
	set scrolloff=7 " how many lines does the cursor need as cushion space
	let c_comment_strings=1
        set autochdir " Changes directory to the file's dir
        set clipboard+=unnamedplus " tell vim to use main clipboard
	" Center screen when entering insert mode:
        autocmd InsertEnter * norm zz
	set splitbelow splitright " set splitting to be more normal:
	set wildmenu " The nice tab completions at the command
	set ignorecase " Ignore case sensitivity when searching
	set smartcase " Tries to be smart about searching
	set lazyredraw " Good for performance when using macros
	set magic " More search stuff
	set showmatch " More search stuff
	set t_Co=16 " Makes vim use the 16 terminal colors only
	set linebreak " Makes line wrapping better
	set textwidth=80 " Max line width before linebreak is triggered
	set wrap " same as linebreak but uses terminal width
	autocmd FileType * setlocal formatoptions-=cro " Disables automatic commenting on new lines
	autocmd BufWritePre * %s/\s\+$//e " Clears trailing Whitespace on save.
        set path+=**
        set hidden
        set wildignore+=**/node_modules/**

" Fileype Specific:
        autocmd BufWritePost *Xresources !xrdb % " Auto reload the Xresources
        autocmd BufNewFile,BufFilePre,BufRead *.md set filetype=markdown

" Indentation:
        filetype plugin indent on
        set autoindent
        " set smartindent
        " This option is set automatically in all C buffers: set cindent
        " Soft tab setup
        set expandtab
        set shiftwidth=4
        set softtabstop=4
        " Hard tab setup
        "set tabstop=4

" Keybinds:
        nnoremap Y y$
	" for writing out and closing
	map <leader>w :w!<CR>
        map <leader>q :q<CR>
	map <leader><CR> :wq<CR>
        " Quick splitting
        nnoremap <leader>h :split<Space>
        nnoremap <leader>v :vsplit<Space>
	" Set spellcheck on or off:
	map <leader>o :setlocal spell! spelllang=en_us<CR>
	" Setting and unsetting relative numberline:
	map <leader>nl :setlocal number<CR>
	map <leader>nk :setlocal number relativenumber<CR>
	map <leader>nj :setlocal norelativenumber \| setlocal nonumber<CR>
	" Shortcutting split navigation:
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l
        " Reindent the whole file (this will force the tab layout outlined above)
        map <C-i> gg=G<C-o>
        " Clears the last search
        map <leader><esc> :let @/ = ""<CR>
        " Easy way to comment out lines
        map <leader>3 :s/^/# / \| let @/ = ""<CR>
        map <leader>' :s/^/" / \| let @/ = ""<CR>
        map <leader>/ :s/^/\/\/ / \| let @/ = ""<CR>
        " And to uncomment...
        map <leader><leader>3 :s/^# // \| let @/ = ""<CR>
        map <leader><leader>' :s/^" // \| let @/ = ""<CR>
        map <leader><leader>/ :s/^\/\/ // \| let @/ = ""<CR>

" Outside Scripts:
        " Compile latex document
        map <leader>cl :w! \| !pdflatex % ./ <CR><CR>
        " Open corresponding .pdf/.html
	map <leader>p :!opout <c-r>%<CR><CR>
        " Latex-Specific Stuff
        autocmd VimLeave *.tex !texclear %

" Statusline Config:
        set laststatus=1
	set statusline=[%n]\ %<%F\ \ \ [%M%R%H%W%Y][%{&ff}]\ \ %=\ line:%l/%L\ col:%c\ \ \ %p%%
        hi statusline ctermfg=8 ctermbg=2 " for some reason fg and bg are swapped.

" Changes cursor shape depending on what mode you're in (only needed for non-neovim)
        let &t_SI = "\<Esc>[6 q"
        let &t_SR = "\<Esc>[4 q"
        let &t_EI = "\<Esc>[2 q"

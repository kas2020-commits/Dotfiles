"        _
" __   _(_)_ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
"   \_/ |_|_| |_| |_|_|  \___|

" Global Rules:
	set nocompatible "sets no compatible to vi-mode
	let mapleader =" "
        set nohlsearch
"         set hidden
	syntax on
        set number relativenumber
        set mouse=a
	set encoding=utf-8
        set spelllang=en_us
        set cursorline " Changes the line the cursor is on
        " set cursorcolumn
	set ruler " Always show cursor location on bottom-right
	set scrolloff=4 " how many lines does the cursor need as cushion space
	let c_comment_strings=1
        set autochdir " Changes directory to the file's dir
        set clipboard+=unnamedplus " tell vim to use main clipboard
	" Center screen when entering insert mode:
"         autocmd InsertEnter * norm zz
	set splitbelow splitright " set splitting to be more normal:
	set wildmenu " The nice tab completions at the command
	set ignorecase " Ignore case sensitivity when searching
	set smartcase " Tries to be smart about searching
	set lazyredraw " Good for performance when using macros
	set magic " More search stuff
	set showmatch " More search stuff
"   	set t_Co=16 " Makes vim use the 16 terminal colors only
        set termguicolors
	set linebreak " Makes line wrapping better
	set textwidth=80 " Max line width before linebreak is triggered
	set wrap " same as linebreak but uses terminal width
	autocmd FileType * setlocal formatoptions-=cro " Disables automatic commenting on new lines
	autocmd BufWritePre * %s/\s\+$//e " Clears trailing Whitespace on save.
        set path+=**
        set hidden
        set wildignore+=**/node_modules/**

" Plugins:
         source $HOME/.config/nvim/plugs/tabline.vim
"         source $HOME/.config/nvim/plugs/buftabline.vim
        "
        source $HOME/.config/nvim/plugs/colorizer.vim
        lua require'colorizer'.setup()
        "
        source $HOME/.config/nvim/colors/onedark.vim
        source $HOME/.config/nvim/plugs/startify.vim

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
        set shiftwidth=8
        set softtabstop=8
        " Hard tab setup
        "set tabstop=4

" Keybinds:
	" Write To Disk:
	map <leader>w :w!<CR>
        map <leader>q :q<CR>
        map <leader><CR> :wq<CR>
        " Tab Management:
        nnoremap <leader>h :Sexplore<CR>
        nnoremap <leader>v :Vexplore<CR>
        nnoremap <m-t>     :tabnew \| Startify<CR>
        nnoremap <m-w>     :tabclose<CR>
	" Set Spellcheck:
	map <leader>o :setlocal spell! spelllang=en_us<CR>
	" Setting Relative Numberline:
	map <leader>nl :setlocal number<CR>
	map <leader>nk :setlocal number relativenumber<CR>
	map <leader>nj :setlocal norelativenumber \| setlocal nonumber<CR>
	" Navigation:
        map <C-h> <C-w>h
        map <C-j> <C-w>j
        map <C-k> <C-w>k
        map <C-l> <C-w>l
        nnoremap <m-h> :tabnext<CR>
        nnoremap <m-l> :tabprev<CR>
        nnoremap <m-k> <C-u>
        nnoremap <m-j> <C-d>
        " Reindent File:
        map <m-i> gg=G<C-o>
        " Clears The Last Search:
        map <leader><esc> :let @/ = ""<CR>
        " Comment Lines:
        map <leader>3 :s/^/# / \| let @/ = ""<CR>
        map <leader>' :s/^/" / \| let @/ = ""<CR>
        map <leader>/ :s/^/\/\/ / \| let @/ = ""<CR>
        map <leader>s *# :%s//
        " Buffer Management:
        map <leader>bb :ls<CR>
        map <leader>bd :bdelete<CR>
        map <leader>bn :bnext<CR>
        map <leader>bp :bprev<CR>
        map <leader>bq :bufdo bd \| Startify<CR>
        " Misc:
        nnoremap Y y$

" Outside Scripts:
        " Compile latex document
        map <leader>cl :w! \| !pdflatex % ./ <CR><CR>
        " Open corresponding .pdf/.html
	map <leader>p :!opout <c-r>%<CR><CR>
        " Latex-Specific Stuff
        autocmd VimLeave *.tex !texclear %

" Statusline Config: (set laststatus to 2 to always see the statusline)
        set laststatus=2
        set showtabline=2
	set statusline=\%<%F\ \ \ [%M%R%H%W%Y][%{&ff}]\ \ %=\ line:%l/%L\ col:%c\ \ \ %p%%

" Cursor:
        let &t_SI = "\<Esc>[6 q"
        let &t_SR = "\<Esc>[4 q"
        let &t_EI = "\<Esc>[1 q"

" Color Stuff:
        highlight CursorLine ctermbg=0 cterm=NONE guibg=#222222
        highlight CursorColumn ctermbg=0 cterm=NONE
        hi statusline   ctermfg=Green  ctermbg=DarkGray  cterm=NONE  guibg=#222222  guifg=#008ae6
        hi TabLine      ctermfg=Black  ctermbg=DarkGray  cterm=NONE  guibg=#404040  guifg=#bbbbbb
        hi TabLineFill  ctermfg=Black  ctermbg=DarkGray  cterm=NONE  guibg=#222222  guifg=#aaaaaa
        hi TabLineSel   ctermfg=White  ctermbg=DarkBlue  cterm=NONE  guibg=#008ae6  guifg=#ffffff


" Small function that, when in visual mode, will rotate between full uppercase,
" full lowercase, or title-case.
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
vnoremap ~ y:call setreg('', TwiddleCase(@"), getregtype(''))<CR>gv""Pgv

" Plugins:
        let g:startify_custom_header =
                                \ [
                                \ '     _   __                _         ',
                                \ '    / | / /__  ____ _   __(_)___ ___ ',
                                \ '   /  |/ / _ \/ __ \ | / / / __ `__ \',
                                \ '  / /|  /  __/ /_/ / |/ / / / / / / /',
                                \ ' /_/ |_/\___/\____/|___/_/_/ /_/ /_/ ',
                                \ ]

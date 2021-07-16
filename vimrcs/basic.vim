"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set encodings
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8

" Use unix as the standard file type
set fileformats=unix,dos,mac

" Turn on filetype detection, plugin and indent
filetype plugin indent on

" ColorScheme
set background=dark
colorscheme darkblue

" Enable syntax highlighting
syntax enable

" Cursor
set cursorline
set cursorcolumn
set cursorlineopt=line
highlight CursorLine cterm=none ctermbg=234
highlight CursorColumn cterm=none ctermbg=234

" Minimal number of screen lines to keep above and below the cursor
set scrolloff=8

" Always show current position
set ruler

" Show line number
set number

" Never show status line
set laststatus=0

" Height of the command bar
set cmdheight=1

" Turn on wild menu, and set ignore files
set wildmenu
set wildignore=*.d,*.o,*.ko,*.elf,*.out,*.a,*.so,*.so.*,*.mod*,*.cmd,.tmp_versions,modules.order,Module.symvers,*~,*/.DS_Store

" Set the number of history lines VIM has to remember
set history=500

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch
highlight Search cterm=none ctermbg=4 ctermfg=15

" Makes search act like search in modern browsers
set incsearch

" Turn on magic for regular expressions
set magic

" Lines longer than the width of the window will wrap and displaying continues on the next line
set wrap

" Specify the keys that move the cursor left/right to move to the previous/next line when the cursor is on the first/last character in the line
set whichwrap+=<,>,[,]

" Copy indent from current line when starting a new line
set autoindent

" Do smart autoindenting when starting a new line
set smartindent

" Set shiftwidth to 4 spaces
set shiftwidth=4

" Set 1 tab eq 4 spaces
set tabstop=4

" Turn backup off
set nobackup
set nowritebackup
set noswapfile

" Turn persistent undo on
set undofile
set undodir=~/.vim/.undodir


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Key maps
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map leader to ';'
let mapleader=";"

" :W sudo saves the file
command! W silent execute 'w !sudo tee % > /dev/null' <bar> edit!

" Navi between windows
nnoremap wh <C-W>h
nnoremap wk <C-W>k
nnoremap wl <C-W>l
nnoremap wj <C-W>j

" Navi between tabs
nnoremap <silent> tn :tabnew<CR>
nnoremap <silent> tc :tabclose<CR>
nnoremap th gT
nnoremap tl gt

" Clear highlight for last matches
nnoremap <silent> ch :let @/ = ""<CR>

" Pressing * or # in visual mode searches for the current selection
vnoremap <silent> * :<C-u>call VSearch()<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VSearch()<CR>?<C-R>=@/<CR><CR>
" Pressing r in visual mode searches and replaces the current selection
vnoremap r :call VSearch()<CR>:%s/<C-R>=@/<CR>/

function! VSearch() range
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    let @/ = l:pattern
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Auto Command
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("autocmd")
    " Jump to the position of the cursor when the file was last closed
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal g'\"" | endif

    " Delete spaces and tabs at the end of line when saving the file
    autocmd BufWritePre *.c,*.cpp,*.h let cursor = getpos('.') | silent! %s/\s\+$//e | call setpos('.', cursor)

    " Expand tabs for C/C++ files
    autocmd FileType c,cpp,h setlocal expandtab

    " Do not inseart comment leader automatically
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
endif

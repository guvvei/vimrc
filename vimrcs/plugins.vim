"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => load plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'Yggdroot/indentLine'
Plug 'preservim/nerdtree'
Plug 'tomtom/tlib_vim'
Plug 'tpope/vim-abolish'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'airblade/vim-gitgutter'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'

call plug#end()



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => indentLine
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set listchars=tab:\┆\ 
set list

let g:indentLine_char='┆'
let g:indentLine_enabled=1



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => nerdtree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeWinPos="left"
let g:NERDTreeShowHidden=1
let g:NERDTreeRespectWildIgnore=1
let g:NERDTreeWinSize=35

nmap <leader>n :NERDTreeToggle<cr>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => gitgutter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gitgutter_enabled=1
let g:gitgutter_set_sign_backgrounds=1

highlight SignColumn ctermbg=0
highlight GitGutterAdd ctermfg=2
highlight GitGutterChange ctermfg=3
highlight GitGutterDelete ctermfg=1

nmap [[ <Plug>(GitGutterPrevHunk)
nmap ]] <Plug>(GitGutterNextHunk)



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => fzf
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:fzf_colors = {
\   'fg':      ['fg', 'Normal'],
\   'bg':      ['bg', 'Normal'],
\   'hl':      ['fg', 'Comment'],
\   'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
\   'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
\   'hl+':     ['fg', 'Statement'],
\   'info':    ['fg', 'PreProc'],
\   'border':  ['fg', 'Normal'],
\   'prompt':  ['fg', 'Conditional'],
\   'pointer': ['fg', 'Exception'],
\   'marker':  ['fg', 'Keyword'],
\   'spinner': ['fg', 'Label'],
\   'header':  ['fg', 'Comment'] }

command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse']}), <bang>0)
command! -bar -bang -nargs=? -complete=buffer Buffers call fzf#vim#buffers(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse']}), <bang>0)

nmap <silent> <leader>a :Ag<CR>
nmap <silent> <leader>b :Buffers<CR>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => cscope
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if filereadable("cscope.out")
    cs add cscope.out
endif

nmap <leader>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <leader>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <leader>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <leader>d :cs find d <C-R>=expand("<cword>")<CR><CR>
nmap <leader>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <leader>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <leader>i :cs find i <C-R>=expand("<cfile>")<CR><CR>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => snipMate
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:snipMate={'snippet_version':1}

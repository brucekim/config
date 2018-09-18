"common option
set number "show line number
syntax on
colorscheme desert
set smartindent
set ai
set cindent "auto indentation for c lang
set tabstop=4
set softtabstop=4
set shiftwidth=4 "set width of auto indentation
set shiftround
set expandtab
set fo=croql
set hlsearch " highlighting keyword
set paste "remove staircase issue when paste
"set autowrite "auto save whenever change focus to other files
"set autoread "auto read whenever file has modified by external

"ctags path
nmap <F5> :set tags+=tags<CR>

"for vim plugin
execute pathogen#infect()
filetype plugin indent on

let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeGlyphReadOnly = "RO"
let g:NERDTreeWinSize = 40

"Open and close all the three plugins on the same time
nmap <F7>   :TrinityToggleAll<CR>

"Open and close the taglist.vim separately
nmap <F8>  :TrinityToggleTagList<CR>

"Open and close the srcexpl.vim separately
nmap <F9>   :TrinityToggleSourceExplorer<CR>
"
"Open and close the NERD_tree.vim separately
nmap <F10>  :TrinityToggleNERDTree<CR>

set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
"set list!


" vim cheatsheet - https://devhints.io/vimscript
" more space for messages in command area to skip enter key twice
set cmdheight=2
"compile&test
function! CompileCpp()
    execute "!clear;g++" expand("%:t")
"    echo expand("%")
    echo expand("%:t")
"    echo expand("%:p:h")
"    echo expand("%:r")
"    echo expand("%:e")
endfunction

function! RunAout()
    execute "!clear;./a.out"
endfunction

nmap <F2> :call CompileCpp()<CR>
nmap <F3> :call RunAout()<CR>

"common option
set number "show line number
syntax on
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
"set paste "remove staircase issue when paste
"set autowrite "auto save whenever change focus to other files
"set autoread "auto read whenever file has modified by external

"ctags path
nmap <F5> :set tags+=tags<CR>

"for vim plugin
execute pathogen#infect()
filetype plugin indent on

colorscheme murphy

let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '?'
let g:NERDTreeDirArrowCollapsible = '?'
let g:NERDTreeGlyphReadOnly = "RO"
let g:NERDTreeWinSize = 40
let g:NERDTreeNodeDelimiter=' '

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
    execute "!clear;g++" "-std=c++14" expand("%:t")
"    echo expand("%")       " path/file.txt
    echo expand("%:t")
"    echo expand("%:p:h")   " /home/you/path/file.txt
"    echo expand("%:r")     " path/file
"    echo expand("%:e")     " txt
endfunction

function! RunAout()
    execute "!clear;./a.out"
endfunction

function! CompileKt()
    execute "!clear;kotlinc" expand("%t") "-include-runtime" "-d" expand("%:r") . ".jar"
endfunction

function! RunKt()
    execute "!clear;java" "-jar" expand("%:r") . ".jar"
endfunction

nmap <F2> :call CompileCpp()<CR>
nmap <F3> :call RunAout()<CR>

nmap <F4> :call CompileKt()<CR>
nmap <F5> :call RunKt()<CR>
1
" esc in insert mode
" ref: https://vi.stackexchange.com/questions/16964/remap-esc-key-in-vim
inoremap kj <esc>

" esc in command mode
cnoremap kj <C-C>
" Note: In command mode mappings to esc run the command for some odd
" historical vi compatibility reason. We use the alternate method of
" existing which is Ctrl-C
1

"cscope
set csprg=/usr/local/bin/cscope
set csto=0
set cst
set nocsverb

if filereadable("./cscope.out")
    cs add cscope.out
endif

"airline, smarter tab line
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#buffer_nr_format = '%s:'

nnoremap <C-t> : enew<Enter>
nnoremap <C-p> : bprevious!<Enter>
nnoremap <C-n> : bnext!<Enter>
nnoremap <C-x> : bp <BAR> bd #<Enter>

"python
let g:python_highlight_all = 1

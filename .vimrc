"common option
set number
syntax on
colorscheme industry
set smartindent
set ai
set cindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab
set fo=croql
set hlsearch


"for vim plugin
execute pathogen#infect()
filetype plugin indent on

let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '?'
let g:NERDTreeDirArrowCollapsible = '?'
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
set list

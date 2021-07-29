"------------------------------------------------------------------
"                                  _                    
"                           _   __(_)___ ___  __________
"                          | | / / / __ `__ \/ ___/ ___/
"                         _| |/ / / / / / / / /  / /__  
"                        (_)___/_/_/ /_/ /_/_/   \___/  
"
"------------------------------------------------------------------
"General 
"---------------------

set encoding=utf8
set number relativenumber 
set wildmode=longest,list,full
set nocompatible 
"set wrap

"---------------------
" Syntax and Indent
"---------------------

syntax on " turn syntax highlighting on 
filetype plugin on "makes vim invoke Latex-Suite when tex file opened
filetype indent on "enables automatic indentation 
set showmatch " show matching braces when text indicator is over them 

" highlight current line but only in active window 
augroup CursorLineOnlyInActiveWindow
	autocmd!
	autocmd VimEnter,Winenter,BufWinEnter * setlocal cursorline 
	autocmd WinLeave * setlocal nocursorline
augroup END 

set autoindent 

" set colours 
""""colo blue
""colo darkblue
"colo default
""colo delek
"colo desert
"colo elflord 
"""colo evening 
" 		colo koehler
"colo morning
" colo murphy
"""colo pablo 
"colo peachpuff 
"colo ron
"""colo shine
"	colo slate
"colo torte
"colo zellner
" set background=dark 


"------------------
" Latex 
" ----------------

" turns default filetype of empty .tex files back to tex 
let g:tex_flavor='latex' 
let g:vimtex_view_method = 'zathura'
autocmd VimLeave *.tex !texclear % 

"------------------
" Misc configs 
"-----------------

let mapleader =","
set nu 
inoremap jk <Esc> 
:nnoremap <F2> :w<bar>!latexmk -pvc % <Enter> 
:nnoremap <F3> :!latexmk -pdf %<Enter>
:nnoremap <F4> :! zathura(echo "%").pdf<Enter>

" disable audiable bell 
set noerrorbells visualbell t_vb= 
" open split panes to the right and bottom 
set splitbelow
set splitright 
" toggle relative numbering 
noremap <C-n> :set rnu!<CR>   

"allow backsace over everything 
:set backspace=indent,eol,start 
" have lines wrap instead of continue off screen
set linebreak 
"improve redrawing 
set ttyfast

" restore last edit position
source $VIMRUNTIME/vimrc_example.vim 

au BufRead,BufNewFile *.tex setlocal textwidth=80

cnoremap w!! execute 'silent! write !sudo tee % >/dev/null/ <bar> edit! "save file as sudo on files that require root permission 

"----------------
" Plugins 
"---------------

        call plug#begin('~/.vim/plugged')
       Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
       Plug 'ap/vim-css-color'
       Plug 'vimwiki/wimwiki'
       Plug 'vim-airline/vim-airline'
       Plug 'vim-airline/vim-airline-themes'
       Plug 'lervag/vimtex'
       Plug 'SirVer/ultisnips'
       let g:UltiSnipsExpandTrigger ="<tab>"
       let g:UltiSnipsJumpForwardTrigger ="<tab>"
       let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
        call plug#end()
	packadd! dracula 
	syntax enable 
	colorscheme dracula  

"-----------------
"Spell check
"-----------------

inoremap <C-l><c-g>u<Esc>[s1z=']a<c-g>u<Enter>
map <leader>o :setlocal spell! spelllang=en_gb<CR> 


"----------------
"Vimling
"----------------

nm <leader><leader>d :call ToggleDeadKeys()<CR>
imap <leader><leader>d <esc>:call ToggleDeadKeys()<CR>a
nm <leader><leader>i :call ToggleIPA()<CR>
imap <leader><leader>i <esc>:call ToggleIPA()<CR>a
nm <F8> :call ToggleProse()<CR>

"-----------------
"Vim-airline
"----------------
let g:airline#extensions#tabline#enabled = 1 "displays all buffers when there is only one tab open 

"----------------
"Nerd tree
"----------------
map <leader>n :NERDTreeToggle<CR>
"-----------------

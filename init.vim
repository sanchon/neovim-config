scriptencoding=utf8
" ---------------------
" General
" ---------------------
set nowrap
set clipboard+=unnamedplus
if has('gui_running')
    set guioptions=abegmrLtT
endif


"--------------------------------------------------------------------------
" usabilidad
"--------------------------------------------------------------------------
set incsearch                                    "busqueda visual chachi
set smartcase
set gdefault                                     "busqueda siempre global

if has('gui_running')
    set autochdir                                "cambia el directorio actual al del fichero abierto
endif

set wildmenu
set wildmode=full


tnoremap <Esc> <C-\><C-n>                        "terminal en Neovim, la tecla por defecto es muy chunga



"para cambiar de buffer rápidamente
"----------------------------------
set hidden                                       "no me importa que haya buffers ocultos
map <F8> :bn<CR>
imap <F8> <Esc>:bn<CR>
map <F7> :bp<CR>
imap <F7> <Esc>:bp<CR>
map <F5> :e<CR>G

"para cambiar de tab rápidamente
"-------------------------------
map <C-Tab> :tabnext<CR>
imap <C-Tab> <Esc>:tabnext<CR>
map <C-S-Tab> :tabprevious<CR>
imap <C-S-Tab> <Esc>:tabprevious<CR>

let g:mapleader='º'



"--------------------------------------------------------------------------
" indenting done right
"--------------------------------------------------------------------------
set tabstop=4
set expandtab
set shiftwidth=4


"--------------------------------------------------------------------------
" aspecto
"--------------------------------------------------------------------------
"set columns=220                           "columnas
syntax on                                 "colorear sintaxis
"set lines=150                             "filas
"set textwidth=100 	                      "rompe autom. los 100 caracteres con un CRLF

if has('gui_running')                                       "El tipo de letra en una gui...
  if has('gui_macvim')                                      " |
    set guifont=Ubuntu\ Mono\ derivative\ Powerline:h12     " ---en Mac OS X
  elseif has('win32')                                       " |
    set guifont=Ubuntu_Mono_derivative_Powerlin:h9:cANSI  " ---en Windows
  else                                                      " |
    set guifont=Droid\ Sans\ Mono\ 8                        " ·--elsewhere
  endif
endif

set number
set relativenumber
set showcmd                               "muestra el comando en la statusline
"--------------------------------------------------------------------------




" ---------------------
" Plug para los plugins
" ---------------------
call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'bling/vim-airline'
Plug 'bling/vim-bufferline'
Plug 'trevordmiller/nova-vim'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-fugitive'
Plug 'sjl/gundo.vim'
Plug 'mrtazz/simplenote.vim'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'yegappan/mru'
Plug 'neomake/neomake'
call plug#end()




" ------------------------------------------------------------------------
"  Colorscheme:solarized
" ------------------------------------------------------------------------
colorscheme nova

" ------------------------------------------------------------------------
"  Plugin:simplenote
" ------------------------------------------------------------------------
source ~/.simplenoterc.vim
let g:SimplenoteVertical=1
let g:SimplenoteFiletype='markdown'
let g:SimplenoteSingleWindow=1
let g:SimplenoteListSize=65
"acceso directo a la nota de urls
command! Urls SimplenoteOpen dd41309e719f11e1a9ddb338ad94a326
command! Todo SimplenoteOpen 1e3fc83d742311e69eb145bdf8915bee



" ------------------------------------------------------------------------
"  Plugin:NerdTree
" ------------------------------------------------------------------------
map <leader>n :NERDTreeToggle<CR>
let g:NERDTreeWinSize=50


" ------------------------------------------------------------------------
"  Plugin:Gundo
" ------------------------------------------------------------------------
map <leader>g :GundoToggle<CR>




" ------------------------------------------------------------------------
"  Plugin:Airline (ojo, necesitas una "patched font" para que mole)
" ------------------------------------------------------------------------
if has('gui_running')
    let g:airline_powerline_fonts=1  "(estos simbolitos no funcionan en la shell)
endif




" ------------------------------------------------------------------------
"  Plugin: Pandoc
" ------------------------------------------------------------------------
let g:pandoc#spell#enabled=0
let g:pandoc#folding#level=20



" ------------------------------------------------------------------------
"  Plugin: Neomake
" ------------------------------------------------------------------------
autocmd InsertChange,TextChanged * update | Neomake
let g:neomake_highlight_lines=1
let g:neomake_open_list=1


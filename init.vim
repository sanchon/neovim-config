scriptencoding=utf8

"=====================
" General
"=====================
set nowrap
set clipboard+=unnamedplus
if has('gui_running')
    set guioptions=abegmrLtT
endif


"========================================================================--
" usabilidad
"========================================================================--
set incsearch                                    "busqueda visual chachi
set smartcase
set gdefault                                     "busqueda siempre global
set autochdir                                    "cambia el directorio actual al del fichero abierto
set wildmenu
set wildmode=full

let g:mapleader='º'

tnoremap <Esc> <C-\><C-n>                        "terminal en Neovim, la tecla por defecto es muy chunga

"para cambiar de buffer rápidamente:
set hidden                                       "no me importa que haya buffers ocultos
map <F8> :bn<CR>
imap <F8> <Esc>:bn<CR>
map <F7> :bp<CR>
imap <F7> <Esc>:bp<CR>
map <F5> :e<CR>G

"para cambiar de tab rápidamente:
imap <C-Tab> <Esc>:tabnext<CR>
map <C-S-Tab> :tabprevious<CR>
imap <C-S-Tab> <Esc>:tabprevious<CR>





"========================================================================--
" indenting done right
"========================================================================--
set tabstop=4
set expandtab
set shiftwidth=4




"========================================================================--
" aspecto
"========================================================================--
syntax on                                 "colorear sintaxis
set number
set relativenumber
set showcmd                               "muestra el comando en la statusline
"========================================================================--




"========================
" Plug para los plugins
"========================
call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
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




"========================================================================
"  Colorscheme:solarized
"========================================================================
colorscheme nova

"========================================================================
"  Plugin:simplenote
"========================================================================
source ~/.simplenoterc.vim
let g:SimplenoteVertical=1
let g:SimplenoteFiletype='markdown'
let g:SimplenoteSingleWindow=1
let g:SimplenoteListSize=65
"acceso directo a la nota de urls
command! Urls SimplenoteOpen dd41309e719f11e1a9ddb338ad94a326
command! Todo SimplenoteOpen 1e3fc83d742311e69eb145bdf8915bee



"========================================================================
"  Plugin:NerdTree
"========================================================================
map <leader>n :NERDTreeToggle<CR>
map <leader>N :NERDTreeFind<CR>
let g:NERDTreeWinSize=50


"========================================================================
"  Plugin:Gundo
"========================================================================
map <leader>g :GundoToggle<CR>




"========================================================================
"  Plugin:Airline (ojo, necesitas una "patched font" para que mole)
"========================================================================
if has('gui_running')
    let g:airline_powerline_fonts=1  "(estos simbolitos no funcionan en la shell)
endif



"========================================================================
"  Plugin: Pandoc
"========================================================================
let g:pandoc#spell#enabled=0
let g:pandoc#folding#level=20



"========================================================================
"  Plugin: Neomake
"========================================================================
autocmd InsertChange,TextChanged * update | Neomake
let g:neomake_highlight_lines=1
let g:neomake_open_list=1


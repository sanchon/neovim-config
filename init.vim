"------------------------------------
" NEOVIM config de Hugo
"------------------------------------


"------------------------------------
" leader=SPACE
"------------------------------------
let mapleader=" "





"-----------------------------------
" USABILIDAD
"-----------------------------------


" para cambiar de buffer rápidamente
set hidden                                       "no me importa que haya buffers ocultos
map <F8> :bn<CR>
imap <F8> <Esc>:bn<CR>
map <F7> :bp<CR>
imap <F7> <Esc>:bp<CR>
map <F5> :e<CR>G

" para cambiar de tab rápidamente
map <C-Tab> :tabnext<CR>
imap <C-Tab> <Esc>:tabnext<CR>
map <C-S-Tab> :tabprevious<CR>
imap <C-S-Tab> <Esc>:tabprevious<CR>


" en Windows copy-paste ctrl-c ctrl-v
set clipboard=unnamed
if has("win32")                                  
	" ---- Windows Like Copy-Paste keys ----
	" CTRL-v is paste
	inoremap <C-v> <esc>"*p<return>i
	" CTRL-x is cut (in visual mode only)
	vnoremap <C-x> "*d
	" CTRL-c is copy (in visual mode only)
	vnoremap <C-c> "*y
endif








"-----------------------------------
" PLUGINS
"-----------------------------------
call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tomtom/tcomment_vim' 
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-capslock'
Plug 'sjl/gundo.vim'
Plug 'scrooloose/nerdtree'
Plug 'mrtazz/simplenote.vim'
Plug 'scrooloose/syntastic'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'bronson/vim-visual-star-search'
Plug 'klen/python-mode'
Plug 'vim-scripts/visSum.vim'
Plug 'yegappan/mru'
Plug 'easymotion/vim-easymotion'
Plug 'thinca/vim-fontzoom'
Plug 'flazz/vim-colorschemes'
Plug 'airblade/vim-gitgutter'
call plug#end()




"--------------------------------------------------------------------------
" ASPECTO
"--------------------------------------------------------------------------
set number
syntax on                                 "colorear sintaxis
set textwidth=0 	                   "rompe autom. a los X caracteres con un CRLF
set relativenumber
set showcmd                               "muestra el comando en la statusline
set listchars=tab:→\ ,trail:·,precedes:«,extends:»,eol:¶,space:·
colorscheme Monokai




" ------------------------------------------------------------------------
"  Plugin:NerdTree
" ------------------------------------------------------------------------
map <leader>n :NERDTreeToggle<CR>
map <leader>N :NERDTreeFind<CR>


" ------------------------------------------------------------------------
"  Plugin:Gundo
" ------------------------------------------------------------------------
map <leader>g :GundoToggle<CR>


" ------------------------------------------------------------------------
"  Plugin: Pandoc
" ------------------------------------------------------------------------
let g:pandoc#spell#enabled=0
let g:pandoc#keyboard#enabled=1
let g:pandoc#folding#level=20
let g:pandoc#filetypes#handled = ["extra","pandoc","markdown"]
let g:pandoc#command#templates_file = split(&runtimepath, ",")[0]."/vim-pandoc-templates"
command! PandocAutoEjecutarMyRevealJsWeb let g:pandoc#command#autoexec_command = "Pandoc #myRevealJsWeb" | let g:pandoc#command#autoexec_on_writes = 1



" ------------------------------------------------------------------------
"  Plugin: Fontzoom
" ------------------------------------------------------------------------
let g:fontzoom_no_default_key_mappings = 1 "por defecto son + y -
map <leader>+ <plug>(fontzoom-larger)
map <leader>- <plug>(fontzoom-smaller)

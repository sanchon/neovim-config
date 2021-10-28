
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
Plug 'tomtom/tcomment_vim' 
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'preservim/nerdtree'
Plug 'mrtazz/simplenote.vim'
Plug 'vim-syntastic/syntastic'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'bronson/vim-visual-star-search'
Plug 'klen/python-mode'
Plug 'yegappan/mru'
Plug 'easymotion/vim-easymotion'
Plug 'thinca/vim-fontzoom'
Plug 'flazz/vim-colorschemes'
Plug 'airblade/vim-gitgutter'
Plug 'vimwiki/vimwiki'
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

" fontzoom no existe, asi que nos lo hacemos nosotros
let s:fontsize = 9
function! AdjustFontSize(amount)
  let s:fontsize = s:fontsize+a:amount
  :execute "GuiFont! Fira\ Code\ Medium:h" . s:fontsize
endfunction
map <leader>+ :call AdjustFontSize(1)<CR>
map <leader>- :call AdjustFontSize(-1)<CR>


"--------------------------------------------------------------------------
" FTP AL HOST
"--------------------------------------------------------------------------
"
" para hacer FTP lo lógico es esto:
let g:netrw_ftpmode="ascii"
"
" usuario y password de ftp en fichero aparte, en windows. En otros sistemas
" mejor usar .netrc
let g:netrw_ftp_cmd= "ftp -s:" . $HOME . "\\MACHINE.ftp"
" al hacer logon con el fichero salen mensajes en la ventana de mensajes... me
" la cargo:
let g:netrw_use_errorwindow=0
let g:netrw_silent=1
" FTPs al host: así me ahorro el mvsp1 y las comillas al inicio y al final:
command! -nargs=+ Host e ftp://mvsp1/\'<args>\'
command! -nargs=+ PLI e ftp://mvsp1/'sys1.cage.fuentes(<args>)' | setlocal filetype=pli
command! -nargs=+ INC e ftp://mvsp1/'cage.maclib(<args>)' | setlocal filetype=pli
command! -nargs=+ JCL e ftp://mvsp1/'sys1.cage.jcllib(<args>)' | setlocal filetype=jcl
command! -nargs=+ JCLD e ftp://mvsp1/'sys1.cage.jcllib(<args>)' | setlocal filetype=sh
command! -nargs=+ FILE e ftp://mvse1/'<args>'
"--------------------------------------------------------------------------

" ------------------------------------------------------------------------
"  Plugin:NerdTree
" ------------------------------------------------------------------------
map <leader>n :NERDTreeToggle<CR>
map <leader>N :NERDTreeFind<CR>




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
"  Plugin: vimwiki
" ------------------------------------------------------------------------
let g:vimwiki_list = [{
   \ 'path':'~\notas', 
   \ 'syntax':'markdown', 
   \ 'ext': '.md',
\}]
let g:vimwiki_global_ext = 0
let g:vimwiki_markdown_link_ext = 1
let g:vimwiki_url_maxsave=0


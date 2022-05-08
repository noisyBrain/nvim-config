syntax on
set number
set relativenumber
set autoindent
set tabstop=2
set shiftwidth=2
set softtabstop=2 
set mouse=a
set clipboard=unnamed
set cursorline
let mapleader = " "
source $HOME/.config/nvim/plug-config/coc.vim



call plug#begin()

" syntax
Plug 'itchyny/lightline.vim' " status bar
Plug 'maximbaz/lightline-ale' " status bar theme

" Themes
Plug 'shinchu/lightline-gruvbox.vim'
Plug 'morhetz/gruvbox'
Plug 'projekt0n/github-nvim-theme'

" Tree
Plug 'scrooloose/nerdtree'

" Typing
Plug 'jiangmiao/auto-pairs' " autoclose de parentesis, llaves, etc
Plug 'alvan/vim-closetag' " autoclose de los tags html
Plug 'tpope/vim-surround' " rodear una palabra entre el caracter elegido solo con seleccionarla y presionar dicho caracter

" Tmux
Plug 'benmills/vimux'
Plug 'christoomey/vim-tmux-navigator' " permite navegar entre las ventanas abiertas de vimux

" Testing
Plug 'tyewang/vimux-jest-test' " para ejecutar tests
Plug 'vim-test/vim-test' " idem anterior

" Autocomplete
Plug 'neoclide/coc.nvim', { 'branch':'release' }

" IDE
Plug 'junegunn/fzf'
Plug 'terryma/vim-multiple-cursors' " funcitonalidad de sublime para tener varios cursores para editar a la vez
Plug 'mhinz/vim-signify' " agrega un signo + o - si se agrega o quita, respectivamente, una línea
Plug 'scrooloose/nerdcommenter' " agregar comentario desde shortcut
Plug 'easymotion/vim-easymotion' " para buscar palabras por combinación de dos letras, cambia una letra y al presionarla te lleva a la palabra seleccionada


call plug#end()


" -------- Mapping --------- "

:imap jk <Esc>
:nmap <leader>w :w <CR>
:nmap <leader>q :q <CR>
:nmap <leader>e :NERDTree <CR>
:nmap <leader>pi :PlugInstall <CR>

" ejecuta el test más cercano de la línea en la que estoy parado
nnoremap <leader>t :TestNeares<CR>

" ejecuta todos los test del archivo
nnoremap <leader>T :TestFile<CR>

" ejecuta toda la suite de tests
nnoremap <leader>TT :TestSuite<CR>


" abre un nuevo panel a la derecha
nnoremap <leader>rp :vsp<CR>


" con el símbolo > o < modifica el tamaño cuando el editor se encuentra dividido
nnoremap <leader>> 10<C-w>
nnoremap <leader>> 10<C-w>

" lleva el cursor al final y al principio de la línea, respectivamente
nnoremap <leader>l $a<Esc>
nnoremap <leader>h 0a<Esc>

" para scrollear más rápido hacia 
nnoremap <C-j> 10<C-e>
nnoremap <C-k> 10<C-y>
nmap <leader>s <Plug>(easymotion-s2)

" ejecutar el archivo que estoy editando en node
nnoremap <leader>x !node %<cr>

set splitright
function! OpenTermianl()
	" mover a la derecha todos los buffer
	execute "normal \<C-1>"
	execute "normal \<C-1>"
	execute "normal \<C-1>"
	execute "normal \<C-1>"

let bufNum = bufnr("%")
let bufType = getbufvar (bufNum, "&bufType", "not found")

if bufType == "terminal"
	" cerrar terminal existente
	execute "q"
else 
	" abrir terminal
	" Ctrl + t para abrir y cerrar una nueva terminal
	execute "vsp term://zsh"

	" apagar los números
	execute "set nonu"
	execute "set nornu"

	" toggle insert enter/exit
	silent au BufLeave <buffer> stopinsert!
	silent au BufWinEnter,WinEnter <buffer> startinsert!

	" establecer maps dentro de la terminal
	execute "tnoremap <buffer> <C-h> <C-\\><C-n><C-w><C-h>"
	execute "tnoremap <buffer> <C-\\><C-\\> <C-\\><C-n>"

	startinsert!
endif
endfunction

colorscheme gruvbox
let g:gruvbox_contrast_dark = "hard"






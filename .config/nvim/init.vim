let mapleader =","

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let &t_8f = "\<Esc>[38:2:%lu:%lu:%lum"
let &t_8b = "\<Esc>[48:2:%lu:%lu:%lum"
set termguicolors

colo termcolors

execute pathogen#infect()

syntax on
filetype plugin indent on
autocmd BufWritePost * :e
autocmd BufNewFile,BufRead,BufWritePost *.zsh-theme set syntax=zsh

" settings
set autoindent
set hlsearch
set tabstop=4
set shiftwidth=0
set number relativenumber
set encoding=utf-8
set foldenable
set foldlevelstart=8
set foldmethod=indent
set laststatus=2
set noshowmode

let g:lightline = {
	\ 'colorscheme': 'termcolors',
	\ }

" Custom bindings for system copy-paste
nmap <C-y> "+yy
nmap <C-x> "+cc
nmap <C-p> "+p
vmap <C-y> "+y
vmap <C-x> "+c
vmap <C-p> "+p

" Switching tabs
nmap <A-TAB> :tabedit 
nmap <A-1> 1gt
nmap <A-2> 2gt
nmap <A-3> 3gt
nmap <A-4> 4gt
nmap <A-5> 5gt
nmap <A-6> 6gt
nmap <A-7> 7gt
nmap <A-8> 8gt
nmap <A-9> 9gt
nmap <A-0> 10gt
nmap H gT
nmap L gt

" Split navigation
set splitbelow
set splitright
nmap <A-h> <C-w>h
nmap <A-j> <C-w>j
nmap <A-k> <C-w>k
nmap <A-l> <C-w>l

" hexHighlight plugin
nmap <leader>h		<Plug>ToggleHexHighlight
nmap <leader>H		<Plug>ToggleSchemeHighlight

" Remove arrow key functionality
noremap <Up>		<Nop>
noremap <Down>		<Nop>
noremap <Left>		<Nop>
noremap <Right>		<Nop>
inoremap <Up>		<Nop>
inoremap <Down>		<Nop>
inoremap <Left>		<Nop>
inoremap <Right>	<Nop>

" Run file from shell
nnoremap <leader>r 		:w<CR> :!%:p<CR>

" Make or make+execute
nnoremap <leader>m 		:w<CR> :make<CR>
nnoremap <leader>x 		:w<CR> :make%<CR> :!./%:r<CR>

" Map <leader><leader> to stop highlighting matches
map <leader><leader> :noh<CR>

" VimWiki bindings
map <leader><CR>t :VimwikiTabnewLink<CR>
map <leader><CR>s :VimwikiSplitLink<CR>

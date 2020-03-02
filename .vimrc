let mapleader =","

au FileType xhtml,xml so ~/.vim/ftplugin/html_autoclosetag.vim

syntax on
set autoindent
set hlsearch
set tabstop=4
set shiftwidth=0
set number relativenumber
set encoding=utf-8
set foldenable
set foldlevelstart=8
set foldmethod=indent
autocmd BufWritePost * :e
colo elflord

" Remove arrow key functionality
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

" LaTeX commands
map <leader>c :!pdflatex %<CR>

" Map <leader><leader> to stop highlighting matches
map <leader><leader> :noh<CR>

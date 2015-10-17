" Edward Hernández
" Vundle {{{

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-sensible'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'PotatoesMaster/i3-vim-syntax'
Plugin 'sjl/gundo.vim'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'tpope/vim-commentary'
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'

call vundle#end()

"}}}

set tabstop=4
set softtabstop=4

filetype plugin indent on
syntax enable

set showmatch
set cursorline
" hi StatusLine ctermbg=white ctermfg=black
set laststatus=2
set autoread
set ruler

set is
set nu
set rnu
set showcmd

function! NumberToggle()
	set nu! rnu!
endfunc

function! s:goyo_enter()
	Limelight
	set nonumber norelativenumber cursorline!
endfunc


let mapleader			= " "

map <leader>n :call NumberToggle()<cr>
map <leader>nu :set nu!<cr>
map <leader>rn :set rnu!<cr>
map <leader>s :w<cr>
map <leader>S :wq<cr>
map <leader>v :source $MYVIMRC<cr>
map <leader>st :set
map <leader>c :q<cr>
map <leader>C :wq<cr>
map <leader>r :s/
map <leader>gr :%s/
map <leader>e :normal i Edward Hernández<ESC>
map <leader>ws :%s/\s\+$//<cr>
map <leader>sc :setlocal spell! spelllang=en_us<cr>
map <leader>p :LLPStartPreview <cr>
map <leader>u :GundoToggle<CR>
map <leader>g :Goyo<CR>:Limelight!!<CR>:set number! relativenumber! cursorline!<CR>
map <leader>l :Limelight!!<CR>
let g:livepreview_previewer = 'zathura'
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_math=1

" vim:foldmethod=marker:foldlevel=0

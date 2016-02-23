" Edward Hernández
" Vundle {{{

set nocompatible
filetype off

" set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#begin()
" 
" Plugin 'gmarik/Vundle.vim'
" Plugin 'tpope/vim-sensible'
" Plugin 'godlygeek/tabular'
" Plugin 'plasticboy/vim-markdown'
" Plugin 'PotatoesMaster/i3-vim-syntax'
" Plugin 'sjl/gundo.vim'
" Plugin 'vim-pandoc/vim-pandoc'
" Plugin 'vim-pandoc/vim-pandoc-syntax'
" Plugin 'tpope/vim-commentary'
" Plugin 'junegunn/goyo.vim'
" Plugin 'junegunn/limelight.vim'
" Plugin 'reedes/vim-pencil'

" call vundle#end()

"}}}

set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab


filetype plugin on
syntax enable

" augroup pencil
  " autocmd!
  " autocmd FileType markdown,mkd call pencil#init()
  " autocmd FileType text         call pencil#init()
" augroup END

set showmatch
" set cursorline
hi StatusLine ctermbg=white ctermfg=black
set laststatus=2
set autoread
set ruler

set foldlevel=3

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

map <leader>C :wq<cr>
map <leader>M :make <cr> <cr>
map <leader>S :wq<cr>
map <leader>c :q<cr>
map <leader>cc I<!-- <Esc>A --><Esc>
map <leader>e :normal i Edward Hernández<ESC>
map <leader>g :Goyo<CR>:Limelight!!<CR>:set number! relativenumber! cursorline!<CR>
map <leader>l :! latexmk -r ~/.latexmkrc %<cr>
map <leader>L :Limelight!!<CR>
map <leader>m :make 
map <leader>md :! pandoc % -s -o %<cr>
map <leader>n :set nu! rnu!<cr>
map <leader>nu :set nu!<cr>
map <leader>p :! python %:p <cr>
map <leader>P :! python %:p 
map <leader>r :%s/
map <leader>rn :set rnu!<cr>
map <leader>s :w<cr>
map <leader>sc :setlocal spell! spelllang=en_us<cr>
map <leader>st :set
map <leader>u :GundoToggle<CR>
map <leader>v :source $MYVIMRC<cr>
map <leader>V :sp ~/.vimrc<cr>
map <leader>ws :%s/\s\+$//<cr>
let g:livepreview_previewer = 'zathura'
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_math=1

" vim:foldmethod=marker:foldlevel=0

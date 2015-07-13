" Edward Hernández
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-sensible'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'PotatoesMaster/i3-vim-syntax'

call vundle#end()
filetype plugin indent on
syntax on
syntax enable

let g:livepreview_previewer = 'zathura'
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_math=1

hi StatusLine ctermbg=white ctermfg=black

set laststatus=2
set is
set nu
set rnu

function! NumberToggle()
	set nu! rnu!
endfunc

let mapleader			= ","

map <Leader>n :call NumberToggle()<cr>
map <Leader>nu :set nu!<cr>
map <Leader>rn :set rnu!<cr>
map <Leader>s :w<cr>
map <Leader>S :wq<cr>
map <Leader>v :source $MYVIMRC<cr>
map <Leader>st :set
map <Leader>c :q<cr>
map <Leader>C :wq<cr>
map <Leader>r :s/
map <Leader>gr :%s/
map <Leader>e :normal i Edward Hernández<ESC>
map <Leader>ws :%s/\s\+$//<cr>
map <Leader>sc :setlocal spell! spelllang=en_us<cr>
map <Leader>p :LLPStartPreview <cr>

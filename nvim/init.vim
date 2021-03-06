" Edward Hernández
" vim-plug {{{

set nocompatible
filetype off

call plug#begin('~/.config/nvim/plugged/')

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'plasticboy/vim-markdown'
Plug 'sjl/gundo.vim'
" Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/seoul256.vim/'
Plug 'sheerun/vim-polyglot'
Plug 'ervandew/supertab'
" Plug 'reedes/vim-pencil'
" Plug 'vim-scripts/LaTeX-Suite-aka-Vim-LaTeX'
call plug#end()
"}}}

set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab

let g:seoul256_background = 237
colo seoul256

filetype plugin on
syntax enable

set showmatch
hi StatusLine ctermbg=white ctermfg=black
set laststatus=2
set autoread
set ruler

set foldlevel=3

set incsearch
set number
set relativenumber
set showcmd

function! NumberToggle()
	set nu! rnu!
endfunc

function! s:goyo_enter()
	Limelight
	set nonumber norelativenumber cursorline!
endfunc

function Focus()
	Goyo!!
	Limelight!!
	set nu! rnu!
endfunc

function PlugFetch()
	!curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endfunc

" mutt
autocmd BufNewFile,BufRead /tmp/mutt-* set filetype=mail
au      Filetype mail setlocal formatoptions+=aw

" literate python
autocmd BufNewFile,BufRead *.mdw set filetype=tex

let mapleader			= " "

map <leader>C :wq<cr>
map <leader>M :make <cr> <cr>
map <leader>S :wq<cr>
map <leader>c :q<cr>
map <leader>cc I<!-- <Esc>A --><Esc>
map <leader>E :normal i Edward Hernández<ESC>
map <leader>e !sh<CR>
map <leader>g :Goyo<CR>
map <leader>f :call Focus()<CR>
map <leader>L :Limelight!!<CR>
map <leader>m :make 
map <leader>md :! pandoc % -s -o %<cr>
map <leader>n :call NumberToggle()<cr>
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
" syntax highlighting for literate python
nnoremap <Leader>lp :setlocal ft=python<cr>
nnoremap <Leader>pl :setlocal ft=tex<cr>
" EasyAlign
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
" vim-clutch
noremap  <silent> <F6> i
inoremap <silent> <F6> <Nop>

let g:vim_markdown_folding_disabled=1
let g:vim_markdown_math=1

" splits {{{
" map <Leader>j <C-W><C-J>
" map <Leader>k <C-W><C-K>
" nnoremap <C-H> <C-W><C-H>
" nnoremap <C-J> <C-W><C-J>
" nnoremap <C-K> <C-W><C-K>
" nnoremap <C-L> <C-W><C-L>

set splitbelow
set splitright
" }}}

" sh goodness {{{
function ShBuffer()
	1,$ !sh
	%y
	call delete(expand('%'))
endfunc

map <leader>sh :split /tmp/tmp.sh<cr>
autocmd BufLeave /tmp/tmp.sh silent call ShBuffer()
" }}}

" vim:fdm=marker:fdl=0

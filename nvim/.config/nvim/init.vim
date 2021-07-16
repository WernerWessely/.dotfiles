
" TODO:
" - Add editable fix list

syntax on
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set incsearch
set number relativenumber
set nu rnu
set nohlsearch
set mouse=a
set hidden
set scrolloff=5
set termguicolors

let mapleader = " "
let g:airline_theme='nord'
let g:airline#extensions#tabline#enabled = 1
let g:deoplete#enable_at_startup = 1
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:rooter_manual_only = 1
let g:rooter_patterns = ['.git']
let g:rooter_change_directory_for_non_project_files = 'current'

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'arcticicestudio/nord-vim'
Plug 'preservim/nerdtree'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'ervandew/supertab'
Plug 'airblade/vim-rooter'
Plug 'tpope/vim-capslock'
Plug 'wellle/targets.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'folke/which-key.nvim'
call plug#end()

" All kinds of ops:
" Write buffer:
nnoremap <silent> <leader><leader>  :w<CR>
" Fuzzy edit in project:
nnoremap <silent> <leader>fp :Rooter <bar> :Files<CR>
" Fuzzy edit in ~:
nnoremap <silent> <leader>ff :Files ~<CR>
" Fuzzy find line:
nnoremap <silent> <leader>fl :Lines<CR>
" Fuzzy switch to buffer:
nnoremap <silent> <leader>fb :Buffers<CR>
" Fuzzy search in project:
nnoremap <silent> <leader>sp :Rooter <bar> :Rg<CR>
" Buffer delete:
nnoremap <silent> <leader>bd :bd<CR>
" Toggle nerdtree:
nnoremap <silent> <leader>tt :NERDTreeToggle<CR>
" Edit nvim config:
nnoremap <silent> <leader>ve :e ~/.config/nvim/init.vim<CR>
" Source nvim config:
nnoremap <silent> <leader>vs :so ~/.config/nvim/init.vim<CR>
" Next buffer:
nnoremap <C-N> :bnext<CR>
" Prev buffer:
nnoremap <C-P> :bprev<CR>

" Windows movements:
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Setup which-key:
lua << EOF
  require("which-key").setup {}
EOF

autocmd BufWritePre * %s/\s\+$//e

colorscheme nord

set colorcolumn=80

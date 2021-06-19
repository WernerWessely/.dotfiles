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

let mapleader = " "
let g:airline_theme='simple'
let g:deoplete#enable_at_startup = 1
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:far#enable_undo=1
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
Plug 'gruvbox-community/gruvbox'
Plug 'preservim/nerdtree'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'ervandew/supertab'
Plug 'brooth/far.vim'
Plug 'airblade/vim-rooter'
call plug#end()

" All kinds of ops:
nnoremap <silent> <leader><space> :w<CR>
nnoremap <silent> <leader>fe :Rooter <bar> :Files<CR>
nnoremap <silent> <leader>fh :Files ~<CR>
nnoremap <silent> <leader>fl :Lines<CR>
nnoremap <silent> <leader>fb :Buffers<CR>
nnoremap <silent> <leader>fs :Rooter <bar> :Rg<CR>
nnoremap <silent> <leader>bd :bd<CR>
nnoremap <silent> <leader>rr :Farr<CR>
nnoremap <silent> <leader>rf :Farf<CR>
nnoremap <silent> <leader>tt :NERDTreeToggle<CR>
nnoremap <silent> <leader>ve :e ~/.config/nvim/init.vim<CR>
nnoremap <silent> <leader>vs :so ~/.config/nvim/init.vim<CR>

" Remap esc to jj:
imap jj <Esc>

" Windows movements:
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

autocmd BufWritePre * %s/\s\+$//e

colorscheme gruvbox

set colorcolumn=80
highlight colorcolumn ctermbg=0 guibg=lightgrey

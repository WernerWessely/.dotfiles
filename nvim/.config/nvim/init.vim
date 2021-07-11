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
set termguicolors

set wildmode=longest:full,full
set wildmenu

let mapleader = " "
let g:airline_theme='nord'
let g:airline#extensions#tabline#enabled = 1
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

" Airline:
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Nord theme:
Plug 'arcticicestudio/nord-vim'

" Nerdtree:
Plug 'preservim/nerdtree'

" Markdown:
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" Rooter, finds root of project:
Plug 'airblade/vim-rooter'

" Targets, lets you edit faster inside of stuff:
Plug 'wellle/targets.vim'

" Telescopic Johnson:
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

call plug#end()

" TJ config:
lua require('telescope')

" All kinds of ops:
" Write buffer:
nnoremap <silent> <leader><leader> :w<CR>
" Buffer delete:
nnoremap <silent> <leader>bd :bd<CR>
" Toggle nerdtree:
nnoremap <silent> <leader>op :NERDTreeToggle<CR>
" Edit nvim config:
nnoremap <silent> <leader>ve :e ~/.config/nvim/init.vim<CR>
nnoremap <silent> <leader>vs :so ~/.config/nvim/init.vim<CR>
" Next buffer:
nnoremap <C-N> :bnext<CR>
" Prev buffer:
nnoremap <C-P> :bprev<CR>

" ...
nnoremap <Leader>fp :Rooter <bar> :lua require('telescope.builtin').find_files({find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<CR>
nnoremap <leader>gp :lua require('telescope.builtin').live_grep()<CR>

nnoremap <leader>pw :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
nnoremap <leader>pb :lua require('telescope.builtin').buffers()<CR>
nnoremap <leader>vh :lua require('telescope.builtin').help_tags()<CR>
nnoremap <leader>vrc :lua require('theprimeagen.telescope').search_dotfiles()<CR>
nnoremap <leader>va :lua require('theprimeagen.telescope').anime_selector()<CR>
nnoremap <leader>vc :lua require('theprimeagen.telescope').chat_selector()<CR>
nnoremap <leader>gc :lua require('theprimeagen.telescope').git_branches()<CR>
nnoremap <leader>gw :lua require('telescope').extensions.git_worktree.git_worktrees()<CR>
nnoremap <leader>gm :lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>

" Windows movements:
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

autocmd BufWritePre * %s/\s\+$//e

colorscheme nord

set colorcolumn=80

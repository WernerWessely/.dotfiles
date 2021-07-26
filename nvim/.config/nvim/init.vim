
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
" For compe:
set completeopt=menuone,noselect
" For which-key:
set timeoutlen=600

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = " "
let g:airline_theme='nord'
let g:airline#extensions#tabline#enabled = 1
let g:rooter_manual_only = 1
let g:rooter_patterns = ['.git']
let g:rooter_change_directory_for_non_project_files = 'current'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
Plug 'airblade/vim-rooter'
Plug 'wellle/targets.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'folke/which-key.nvim'
Plug 'hrsh7th/nvim-compe'
Plug 'phaazon/hop.nvim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'neovim/nvim-lspconfig'
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Setup fzf:
" Make sure we fuzzy search hidden files as well:
command! -bang -nargs=* Rg call fzf#vim#grep(
    \ 'rg --column --line-number --no-heading --color=always --smart-case
    \ --hidden -g "!.git" -- '.shellescape(<q-args>), 1, fzf#vim#with_preview(), <bang>0)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Setup which-key:
lua << EOF
  require("which-key").setup {}
EOF

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Setup Compe:
let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'always'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.resolve_timeout = 800
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true

let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true

inoremap <silent><expr> <C-Space>   compe#complete()
inoremap <silent><expr> <Tab>       compe#confirm('<Tab>')

" Automatically select first match:
lua << EOF
    vim.api.nvim_set_keymap("i", "<CR>", "compe#confirm({ 'keys': '<CR>', 'select': v:true })", { expr = true })
EOF

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Setup lsp:
lua << EOF
    require'lspconfig'.pyright.setup{}
    require'lspconfig'.clangd.setup{}
EOF

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Setup hop:
lua << EOF
    require("hop").setup()
EOF

nnoremap <silent> s :HopChar1 <CR>
nnoremap <silent> <S-S> :HopChar2 <CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufWritePre * %s/\s\+$//e

colorscheme nord

set colorcolumn=80

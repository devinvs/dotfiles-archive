syntax on
colorscheme material

set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set expandtab

set number
set showcmd

filetype indent on
set lazyredraw

set showmatch
set incsearch
set hlsearch

let mapleader=","

nnoremap <leader><space> :nohlsearch<CR>

set foldenable
set foldlevelstart=10

nnoremap <space> za

set foldmethod=indent

nnoremap j gj
nnoremap k gk

" File Execution Shortcuts
autocmd FileType python map <buffer> <F5> :w<CR>:exec '!python' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F5> <esc>:w<CR>:exec '!python' shellescape(@%, 1)<CR>

autocmd FileType rust map <buffer> <F5> :w<CR>:exec '!cargo run'<CR>
autocmd FileType rust imap <buffer> <F5> <esc>:w<CR>:exec '!cargo run'<CR>

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

" Plugins Here
Plugin 'ycm-core/YouCompleteMe'
Plugin 'Vundlevim/Vundle.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'dense-analysis/ale'
Plugin 'mattn/emmet-vim'
Plugin 'cespare/vim-toml'
Plugin 'chrisbra/Colorizer'

call vundle#end()
filetype plugin indent on

let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

let g:ycm_show_diagnostics_ui = 0

let g:ale_linters = {
\    'bash': ['language-server'],
\    'c': ['gcc'],
\    'c++': ['gcc'],
\    'css': ['csslint'],
\    'html': ['htmlhint'],
\    'java': ['javac'],
\    'javascript': [],
\    'json': ['jsonlint'],
\    'python': ['autopep8', 'flake8'],
\    'rust': ['analyzer'],
\    'scss': ['sass-lint'],
\    'typescript': ['tsserver']
\}

let g:ale_fixers = {
\    '*': ['remove_trailing_lines', 'trim_whitespace'],
\    'css': ['prettier'],
\    'html': ['prettier'],
\    'javascript': ['prettier'],
\    'json': ['prettier'],
\    'scss': ['prettier'],
\    'typescript': ['prettier']
\}

let g:ale_vix_on_save = 1
let g:ale_set_highlights = 0

highlight ALEError ctermbg=Black
highlight ALEWarning ctermbg=Black

highlight ALEError ctermbg=none cterm=underline
highlight ALEWarning ctermbg=none cterm=underline

let g:colorizer_auto_color = 1

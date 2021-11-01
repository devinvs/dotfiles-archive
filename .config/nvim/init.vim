set guicursor=
syntax on

set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

set backspace=indent,eol,start

set number
set showcmd

filetype indent on
set tabstop=4   " Display tab as 4 spaces
set expandtab   " Insert 4 spaces instead of tabs
set softtabstop=4
set shiftwidth=4
set autoindent
set smartindent
set smarttab
set textwidth=120

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
autocmd FileType rust map <buffer> <F6> :w<CR>:exec '!cargo test'<CR>

call plug#begin()

" Plugins Here
Plug 'jiangmiao/auto-pairs'
Plug 'dense-analysis/ale'
Plug 'cespare/vim-toml'
Plug 'chrisbra/Colorizer'
Plug 'DevinVS/material.vim', {'branch': 'main'}
Plug 'ntpeters/vim-better-whitespace'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'clangd/coc-clangd', {'do': 'yarn install --frozen-lockfile'}
Plug 'voldikss/coc-cmake', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
Plug 'amiralies/coc-discord', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-emmet', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-eslint', {'do': 'yarn install --frozen-lockfile'}
Plug 'iamcco/coc-flutter', {'do': 'yarn install --frozen-lockfile'}
Plug 'Eric-Song-Nop/coc-glslx', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-html', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-java', {'do': 'yarn install --frozen-lockfile'}
Plug 'pappasam/coc-jedi', {'do': 'yarn install --frozen-lockfile && yarn build', 'branch': 'main'}
Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
Plug 'fannheyward/coc-markdownlint', {'do': 'yarn install --frozen-lockfile'}
Plug 'weirongxu/coc-markdown-preview-enhanced', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-prettier', {'do': 'yarn install --frozen-lockfile'}
Plug 'fannheyward/coc-rust-analyzer', {'do': 'yarn install --frozen-lockfile'}
Plug 'josa42/coc-sh', {'do': 'yarn install --frozen-lockfile'}
Plug 'fannheyward/coc-sql', {'do': 'yarn install --frozen-lockfile'}
Plug 'kkiyama117/coc-toml', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-yaml', {'do': 'yarn install --frozen-lockfile'}
Plug 'fannheyward/coc-xml', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}


call plug#end()

colorscheme material

autocmd! BufNewFile,BufRead *.glsl,*.vs,*.fs set ft=glsl

set completeopt=preview

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

let g:ale_set_highlights = 0

highlight ALEError ctermbg=Black
highlight ALEWarning ctermbg=Black

highlight ALEError ctermbg=none cterm=underline
highlight ALEWarning ctermbg=none cterm=underline

let g:colorizer_auto_color = 1
set completeopt-=preview


" Vim Plug:
runtime plugins.vim

" COC Config:
runtime coc-config.vim

" Map leader key to space
nnoremap <SPACE> <Nop>
let mapleader=" "

" Keep marks
keepmarks


" UI Config
set nu
set relativenumber
set showmatch
set incsearch
set showcmd
set wildmenu
set ignorecase
set smartcase
set cmdheight=2
set signcolumn=yes

" Folding
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=syntax

" Tabs & Tabbery
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set copyindent

set hidden
set nobackup
set encoding=utf-8
set nowritebackup

" Navigating buffers
nnoremap gb :bnext<CR>
nnoremap gB :bprevious<CR>

" Yank to system clipboard also
set clipboard=unnamedplus

" Status Line:
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#branch#enabled = 1

" Appearance: Solarized
syntax on
set termguicolors
set bg=dark
colorscheme NeoSolarized
highlight clear LineNr "Leave the gutter transparent.
let g:airline_theme = 'solarized'

" Appearance: Gruvbox
" syntax on
" let g:gruvbox_contrast_dark = "medium"
" let g:gruvbox_contrast_light = "medium"
" set bg=dark
" set bg=light
" colorscheme gruvbox
" set termguicolors
" let g:airline_theme = 'gruvbox'

" FZF:
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }
nnoremap <leader>F :Rg<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>s :BLines<CR>
nnoremap <leader>/ :BLines<CR>
nnoremap <leader>: :Commands<CR>
nnoremap <leader>; :Commands<CR>
nnoremap <leader>f :Files<CR>

" Move cursor to beginning or end of line.
map <C-a> ^
map <C-e> $

" jj to exit insert mode
imap jj <esc>
imap kk <esc>

" Semicolons are colons, commas are semicolons.
nnoremap ; :
vnoremap ; :
nnoremap , ;
vnoremap , ;

" turn off search highlights
nmap <leader><space> :nohlsearch<CR>

" Set shell to work around some fish bugs
set shell=/bin/bash

" ALE:
" let g:ale_completion_enabled = 0
" let g:ale_sign_column_always = 1
" let g:airline#extensions#ale#enabled = 1

" LSP:
" let g:airline#extensions#languageclient#enabled = 1

" Completion:
" set omnifunc=syntaxcomplete#Complete
" set completeopt+=menu
" set completeopt+=noselect
" set completeopt+=preview
" set completeopt+=noinsert
" let g:mucomplete#enable_auto_at_startup = 1
" let g:mucomplete#completion_delay = 90
" let g:mucomplete#reopen_immediately = 0

" Automatically close the preview window.
" autocmd CompleteDone * pclose

filetype plugin indent on

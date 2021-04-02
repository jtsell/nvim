" Vim Plug:
runtime plugins.vim

" COC Config:
runtime coc-config.vim

" Leader Space:
nnoremap <SPACE> <Nop>
let mapleader=" "

" UI Config:
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

" Folding:
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=syntax

" Marks:
keepmarks
" set foldmethod=marker

" Tabs:
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set copyindent

" Miscellaneousness:
set hidden
set encoding=utf-8
set nobackup
set nowritebackup

" Allow mouse usage
set mouse=a

" Yank to system clipboard also
set clipboard=unnamedplus

" Netrw:
let netrw_liststyle=3
let g:netrw_keepdir=1

" Navigating Buffers:
nnoremap bn :bnext<CR>
nnoremap bp :bprevious<CR>
nnoremap bd :bdelete<CR>

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

" Git:
" Open vim with Git.
function Onlygit()
    :G
    :wincmd j
    :bdelete
endfunction

" Fugitive Conflict Resolution
nnoremap <leader>gd :Gvdiffsplit!<CR>
nnoremap gdh :diffget //2<CR>| " From the buffer on the left (Target)
nnoremap gdl :diffget //3<CR>| " From the buffer on the right (Merge)

filetype plugin indent on

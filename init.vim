" Leader:
nnoremap <SPACE> <Nop>
let mapleader=" "

" Terminal Specific Config:
if $TERM_PROGRAM == "iTerm.app"
    runtime iterm2.vim
endif

" Vim Plug:
runtime plugins.vim

" COC Config:
runtime coc-config.vim

" Theme:
runtime theme.vim

" Telescopic Johnson:
" runtime telescope.vim

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
let g:indentLine_setColors = 1
let g:indentLine_color_gui = "#073642"
let g:indentLine_char = '┊'

" Miscellaneousness:
set hidden
set encoding=utf-8
set nobackup
set nowritebackup
set mouse=a

" Yank to system clipboard also
set clipboard=unnamedplus

" Netrw:
let netrw_liststyle=3
let g:netrw_keepdir=1

" Navigating Buffers:
nnoremap gb :bnext<CR>
nnoremap gB :bprevious<CR>
" nnoremap <leader>bd :bdelete<CR>

" FZF:
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }
nnoremap <leader>F :Rg<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>s :BLines<CR>
nnoremap <leader>/ :BLines<CR>
nnoremap <C-_> :BLines<CR>
nnoremap <leader>: :Commands<CR>
nnoremap <leader>; :Commands<CR>
nnoremap <leader>f :call GFiles_or_Files()<CR>
" nnoremap <leader>f :Files<CR>

" Move cursor to beginning or end of line.
map <C-a> ^
map <C-e> $

" Exit insert mode. Sorry Dijkstra.
imap jj <esc>
imap kk <esc>
imap jk <esc>
imap kj <esc>

" Semicolons are colons, commas are semicolons.
nnoremap ; :
vnoremap ; :
nnoremap , ;
vnoremap , ;

" turn off search highlights
nmap <leader><space> :nohlsearch<CR>

" Ignore when I fatfinger the touchbar
noremap <F1> <Nop>

" Set shell to work around some fish bugs
set shell=/bin/bash

" set completeopt+=menu
" set completeopt+=noselect
" set completeopt+=preview
" set completeopt+=noinsert
" autocmd CompleteDone * pclose

" Git:
" Open vim with Git. Mapped to C-g in my fish config.
function Git_or_Files()
    silent! !git rev-parse --is-inside-work-tree
    if v:shell_error == 0
        :G
        :wincmd j
        :bdelete
    else
        :Files
    endif
endfunction

" Open a fugitive command without splitting.
function! Git_Nosplit(command)
    execute "G " . a:command
    :wincmd j
    :q
endfunction

" Use FZF GFiles if we're in a repo, otherwise use Files
function! GFiles_or_Files()
    silent! !git rev-parse --is-inside-work-tree
    if v:shell_error == 0
        :GFiles
    else
        :Files
    endif
endfunction

" Fugitive Conflict Resolution
nnoremap <leader>gd :Gvdiffsplit!<CR>
nnoremap gdh :diffget //2<CR>| " From the buffer on the left (Target)
nnoremap gdl :diffget //3<CR>| " From the buffer on the right (Merge)

" Other git mappings
nnoremap <leader>gb :G blame<CR>
nnoremap <leader>gc :BCommits<CR>
nnoremap <leader>gC :Commits<CR>
nnoremap <leader>gs :call Git_Nosplit("show")<CR>
nnoremap <leader>gg :call Git_Nosplit("")<CR>
nnoremap <leader>gl :call Git_Nosplit("log")<CR>

" Copy filenames
nmap <leader>yf :let @*=expand("%")<CR>| " Yank filename from working directory.
nmap <leader>yF :let @*=expand("%:p")<CR>| " Yank full path filename.

" Prettier:
let g:prettier#autoformat = 1
let g:prettier#autoformat_config_present = 1
let g:prettier#exec_cmd_async = 1

filetype plugin indent on

call plug#begin() 

" Solarized Theme:
Plug 'overcache/NeoSolarized'

" Rainbow Parens:
Plug 'junegunn/rainbow_parentheses.vim', {'do': ':RainbowParentheses'}

" Indentation Guides:
Plug 'Yggdroot/indentLine'

" Rainbow Parens:
Plug 'junegunn/rainbow_parentheses.vim'

" FZF: Fuzzy finder integration.
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

" JSON:
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
call plug#end()

" Theme:
runtime theme.vim

" Status line
set laststatus=0
set cmdheight=1
set readonly

" No menu bar and tool bar
set guioptions=aiMr

" Key bindings.
nmap b <C-B><C-G>
nmap q :q!<CR>
nnoremap <Up> <C-Y>
nnoremap <C-P> <C-Y>
nnoremap <Down> <C-E>
nnoremap <C-N> <C-E>

" To type the following line, type *two* C-V's followed by two spaces. This
" is how you map the spacebar.
" nmap ^V <C-F><C-G>
"
" turn off search highlights
nmap <leader><space> :nohlsearch<CR>

" Map leader key to space
nnoremap <SPACE> <Nop>
let mapleader=" "

" FZF:
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }
nnoremap <leader>F :Rg<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>s :BLines<CR>
nnoremap <leader>/ :BLines<CR>
nnoremap <leader>: :Commands<CR>
nnoremap <leader>; :Commands<CR>
" nnoremap <leader>f :Files<CR>
" set modifiable!

" Yank to system clipboard also
set clipboard=unnamedplus

set mouse=a

" Move cursor to beginning or end of line.
map <C-a> ^
map <C-e> $

" Ignore when I fatfinger the touchbar
noremap <F1> <Nop>

" turn off search highlights
nmap <leader><space> :nohlsearch<CR>

" Prettier:
let g:prettier#autoformat = 1
let g:prettier#autoformat_config_present = 1
let g:prettier#exec_cmd_async = 1

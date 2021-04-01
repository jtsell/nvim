call plug#begin() 

" Solarized Theme:
Plug 'overcache/NeoSolarized'

" Rainbow Parens:
Plug 'junegunn/rainbow_parentheses.vim', {'do': ':RainbowParentheses'}

call plug#end()

" Status line
set laststatus=0
set cmdheight=1
set readonly

" No menu bar and tool bar
set guioptions=aiMr

" Key bindings.
nmap b <C-B><C-G>
nmap q :q!<CR>
nmap <Up> <C-Y>
nmap <Down> <C-E>

" To type the following line, type *two* C-V's followed by two spaces. This
" is how you map the spacebar.
" nmap ^V <C-F><C-G>

" Appearance: Solarized
syntax on
set termguicolors
set bg=dark
colorscheme NeoSolarized
highlight clear LineNr "Leave the gutter transparent.
let g:airline_theme = 'solarized'

" turn off search highlights
nmap <leader><space> :nohlsearch<CR>

" Map leader key to space
nnoremap <SPACE> <Nop>
let mapleader=" "

" set modifiable!

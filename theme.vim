" let hour = strftime("%H") " Set the background light from 7am to 7pm
" if 7 <= hour && hour < 19
"   set background=light
" else " Set to dark from 7pm to 7am
" endif



" Status Line:
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#branch#enabled = 0
let g:airline#extensions#tabline#show_buffers = 1
syntax on

set background=dark
" set background=light
set termguicolors
colorscheme NeoSolarized
" colorscheme gruvbox
let g:airline_theme = 'solarized'
" hi normal ctermbg=NONE
highlight Normal guibg=NONE ctermbg=NONE
highlight clear LineNr "Leave the gutter transparent.


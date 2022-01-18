" let hour = strftime("%H") " Set the background light from 7am to 7pm
" if 7 <= hour && hour < 19
"   set background=light
" else " Set to dark from 7pm to 7am
" endif




" set background=light
" colorscheme NeoSolarized
" highlight Normal guibg=NONE ctermbg=NONE
colorscheme gruvbox
set background=dark
set termguicolors

" Gutter
let g:gitgutter_set_sign_backgrounds = 0
highlight GitGutterAdd cterm=NONE guifg=#b8bb26
highlight GitGutterChange cterm=NONE guifg=#8ec07c
highlight GitGutterDelete cterm=NONE guifg=#fb4934
highlight GitGutterChangeDelete cterm=NONE guifg=#8ec07c
autocmd VimEnter * GitGutterLineHighlightsDisable

highlight clear LineNr "Leave the gutter transparent.
highlight SignColumn ctermbg=NONE guibg=NONE cterm=NONE
" highlight clear SignColumn


" Status Line:
let g:airline_theme = 'gruvbox'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#branch#enabled = 0
let g:airline#extensions#tabline#show_buffers = 1
syntax on


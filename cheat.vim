" See bindings from plugged/cheat.sh-vim/plugin/cheat.vim
" https://awesomeopensource.com/project/dbeniamine/cheat.sh-vim
let g:CheatSheetShowCommentsByDefault=0
let g:CheatSheetDoNotMap=1
nnoremap <script> <silent> <leader>CC :call cheat#cheat("", getcurpos()[1], getcurpos()[1], 0, 0, '!')<CR>
vnoremap <script> <silent> <leader>CC :call cheat#cheat("", -1, -1, 2, 0, '!')<CR>
nnoremap <script> <silent> <leader>CP :call cheat#cheat("", getcurpos()[1], getcurpos()[1], 0, 1, '!')<CR>
vnoremap <script> <silent> <leader>CP :call cheat#cheat("", -1, -1, 2, 1, '!')<CR>
nnoremap <script> <silent> <leader>CK :call cheat#navigate(0, 'C')<CR>
vnoremap <script> <silent> <leader>CK :call cheat#navigate(0, 'C')<CR>

" Python Settings

" Use custom keymap only
let g:jupyter_mapkeys = 0

" Run black on current file
command! Black execute "!black -l 79 %"

" I forget what this does.
let python_highlight_all = 1

" Lumpy Space Princess:
let g:LanguageClient_serverCommands = {
\   'python': ['pyls'],
\ }

" Connect to Jupyter:
nmap <buffer> <silent> <leader>jj :JupyterConnect<CR>
" Have Jupyter cd to cwd:
nmap <buffer> <silent> <leader>jd :JupyterCd %:p:h<CR>
" Import file into Jupyter:
nmap <buffer> <silent> <leader>ji :PythonImportThisFile<CR>
" Run current cell in Jupyter
nmap <buffer> <silent> <leader>jc :JupyterSendCell<CR>
" Send the selected stuff to Jupyter
map <buffer> <silent> <leader>jx :JupyterSendRange<CR>
" au BufNewFile, BufRead *.py \
nnoremap <buffer> H :<C-u>execute "!pydoc3 " . expand("<cword>")<CR>

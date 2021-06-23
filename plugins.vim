call plug#begin() 

" COC:
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Themes:
" Solarized
Plug 'overcache/NeoSolarized'

" Gruvbox:
Plug 'morhetz/gruvbox'

" Airline: Fancy Status Bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Colors: Colorize colors.
Plug 'chrisbra/colorizer'

" Comment Code: gcc to comment out a line
Plug 'tpope/vim-commentary'

" Repeat: Makes it possible to repeat plugin actions with .
Plug 'tpope/vim-repeat' 

" Surround: Use ysiw or cs in normal mode or S in visual mode.
Plug 'tpope/vim-surround'

" Devicons:
Plug 'ryanoasis/vim-devicons'

" FZF: Fuzzy finder integration.
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

" Telescope:
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Git:
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Vim Vinegar: netrw enhancement
" Plug 'tpope/vim-vinegar'

" Taskwarrior:
" Plug 'blindFS/vim-taskwarrior'

" Codi: Interactive scratchpad.
" Plug 'metakirby5/codi.vim'

" Zeal: Offline document viewer integration
" Plug 'KabbAmine/zeavim.vim'

" Open Browser: Allow plugins to open a browser.
Plug 'tyru/open-browser.vim'

" Dispatch: Lets plugins run commands outside of vim.
Plug 'tpope/vim-dispatch'

" Snippets:
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'
"
" MuComplete: CoC still wins.
" Plug 'lifepillar/vim-mucomplete' 

" ALE: CoC does it better.
" Plug 'dense-analysis/ale'

" LanguageClient: CoC *still* does it better.
" Plug 'autozimu/LanguageClient-neovim', {
"     \ 'branch': 'next',
"     \ 'do': 'bash install.sh',
"     \ }

" Indentation Guides:
" Plug 'thaerkh/vim-indentguides'
Plug 'Yggdroot/indentLine'
" Plug 'nathanaelkane/vim-indent-guides'

" JSON:
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

" Javascript:
" Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'yuezk/vim-js'

" S Expressions:
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'

" Parinfer:
" Plug 'bhurlow/vim-parinfer' 
Plug 'eraserhd/parinfer-rust', {'do': 'cargo build --release'}

" Clojure:
Plug 'tpope/vim-fireplace', {'for': 'clojure'}
Plug 'guns/vim-clojure-static', {'for': 'clojure'}
Plug 'guns/vim-clojure-highlight', {'for': 'clojure'}
" Plug 'venantius/vim-cljfmt', {'for': 'clojure'}
Plug 'clojure-vim/async-clj-omni', {'for': 'clojure'}

" Rainbow Parens:
Plug 'junegunn/rainbow_parentheses.vim'

" Swift:
Plug 'toyamarinyon/vim-swift', {'for': 'swift'}

" Fish:
Plug 'dag/vim-fish', {'for': 'fish'}

" Zsh:
Plug 'chrisbra/vim-zsh', {'for': 'zsh'}

" SXHKD: Config file highlighting
Plug 'kovetskiy/sxhkd-vim', {'for': 'sxhkd'}

" PlantUML Plugins:
" PlantUML Syntax and Filetype
Plug 'aklt/plantuml-syntax', {'for': 'plantuml'}
" Browser-based PlantUML previews
Plug 'weirongxu/plantuml-previewer.vim', {'for': 'plantuml'}
" Live Markdown + PlantUML
Plug 'kannokanno/previm', {'for': ['plantuml', 'markdown']}
" Text-based PlantUML previews
" Plug 'scrooloose/vim-slumlord', {'for': 'plantuml'}

" Python Plugins:
" Connect to running jupyter consoles or notebooks.
Plug 'jupyter-vim/jupyter-vim'
" Plug 'jupyter-vim/jupyter-vim', {
"     \ 'for': 'python', 
"     \ 'commit': '195b500d3ca1c4d8b06d6199b0e02966c23e6b06'}

" Better Python indentation.
Plug 'vim-scripts/indentpython', {'for': 'python'}

" Better Python syntax highlighting.
Plug 'kh3phr3n/python-syntax', {'for': 'python'}

" Vimwiki:
Plug 'vimwiki/vimwiki'

call plug#end()

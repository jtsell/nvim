vim.deprecate = function() end

require("plugins")
require("theme")

local map = vim.api.nvim_set_keymap

--g.prettier#autoformat = 1
--g.prettier#autoformat_config_present = 1
--g.prettier#exec_cmd_async = 1
--g.vimwiki_list = [main_wiki, journal_wiki]
-- nnoremap <leader>gC :Commits<CR>
-- nnoremap <leader>gb :G blame<CR>
-- nnoremap <leader>gc :BCommits<CR>
-- nnoremap <leader>gd :Gdiffsplit!<CR>
-- nnoremap <leader>gg :call Git_Nosplit("")<CR>
-- nnoremap <leader>gl :call Git_Nosplit("log")<CR>
-- nnoremap <leader>gs :call Git_Nosplit("show")<CR>
-- nnoremap gdh :diffget //2<CR>| " From the buffer on the left (Target)
-- nnoremap gdl :diffget //3<CR>| " From the buffer on the right (Merge)
-- set completeopt+=menu
--set completeopt+=noselect
--set completeopt+=preview
--set completeopt+=noinsert
-- o.nobackup=true
-- o.nowritebackup=true

vim.o.autoindent = true
vim.o.clipboard = "unnamedplus"
vim.o.cmdheight = 1
vim.o.copyindent = true
vim.o.encoding = "utf-8"
vim.o.expandtab = true
vim.o.foldenable = true
vim.o.foldlevelstart = 10
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldnestmax = 10
vim.o.hidden = true
vim.o.ignorecase = true
vim.o.incsearch = true
vim.o.mouse = "a"
vim.o.nu = true
vim.o.relativenumber = true
vim.o.shiftwidth = 2
vim.o.showcmd = true
vim.o.showmatch = true
vim.o.signcolumn = "yes"
vim.o.smartcase = true
vim.o.smartindent = true
vim.o.smarttab = true
vim.o.softtabstop = 2
vim.o.tabstop = 2
vim.o.wildmenu = true
vim.o.scrolloff = 12
vim.o.showmode = false
vim.o.ignorecase = true

vim.g.AutoPairsMapCR = 0
vim.g.clj_fmt_autosave = 0
vim.g.clojure_align_multiline_strings = 1
vim.g.clojure_align_subforms = 1
vim.g.indentLine_char = "│"
vim.g.mapleader = " "
vim.g.netrw_keepdir = 1
vim.g.markdown_fenced_languages = { "clojure" }

vim.wo.wrap = false
-- vim.wo.wrap = true
-- vim.wo.linebreak = true
-- vim.wo.breakindent = true

map("n", "<SPACE>", "<Nop>", { noremap = true })
map("i", "jj", "<esc>", { noremap = true })
map("i", "jk", "<esc>", { noremap = true })
map("i", "kj", "<esc>", { noremap = true })
map("i", "kk", "<esc>", { noremap = true })
map("n", ",", ";", { noremap = true })
map("n", ";", ":", { noremap = true })
map("n", "<C-a>", "^", { noremap = true })
map("n", "<C-e>", "$", { noremap = true })
map("n", "<F1>", "<Nop>", { noremap = true })
map("n", "<SPACE>", "<Nop>", { noremap = true })
map("n", "<leader><space>", ":nohlsearch<CR>", { noremap = true })
map("n", "<leader>yF", ':let @*=expand("%:p")<CR>|', { noremap = true })
map("n", "<leader>yf", ':let @*=expand("%")<CR>|', { noremap = true })
-- map('n', 'BD', ':bd<CR>', { noremap = true })
map("n", "gB", ":bprevious<CR>", { noremap = true })
map("n", "gb", ":bnext<CR>", { noremap = true })
map("v", ",", ";", { noremap = true })
map("v", ";", ":", { noremap = true })
map("n", "th", ":tabm -1<CR>", { noremap = true })
map("n", "tl", ":tabm +1<CR>", { noremap = true })
map("n", "<leader>ww", ":w<CR>", { noremap = true })
map("n", "<leader>wq", ":wq<CR>", { noremap = true })
map("t", "<ESC><ESC>", "<C-\\><C-n>", { noremap = true })
map("n", "<Leader>pp", 'V"0p', { noremap = true })
map("v", "<Leader>pp", '"0p', { noremap = true })

map(
	"n",
	"<localleader>po",
	":ConjureEval (require 'portal.api) (portal.api/tap) (portal.api/open {:theme :portal.colors/gruvbox :app false})<CR>",
	{ noremap = true }
)

vim.cmd([[command! Less runtime pager.vim]])
-- vim.cmd([[
--   autocmd BufEnter * lua require'completion'.on_attach()
--   set completeopt=menuone,noinsert,noselect
--   imap <silent> <c-p> <Plug>(completion_trigger)
-- ]])
-- vim.api.nvim_add_user_command('Less', require 'pager')
--
vim.cmd([[autocmd FileType graphql setlocal commentstring=#\ %s]])

map("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", { noremap = true, silent = true })

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	callback = function()
		vim.opt.formatoptions:remove({ "r", "o" })
	end,
})
vim.opt_global.formatoptions:remove({ "r", "o" })

map("n", "gcp", ":yank | Commentary | put<CR>", { noremap = true })

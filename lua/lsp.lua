local custom_lsp_attach = function(client, bufnr)
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', '<leader>k', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', '<leader>d', vim.lsp.buf.type_definition, bufopts)
  -- vim.keymap.set('n', '<leader>p', vim.lsp.buf.format, bufopts)
  if client.server_capabilities.documentFormattingProvider then
    vim.keymap.set('n', '<leader>p', function() vim.lsp.buf.format { async = true } end, bufopts)
  end
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  -- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gI', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'gD', "<cmd>tab split | lua vim.lsp.buf.definition()<CR>", bufopts)
  vim.keymap.set('n', 'ge', vim.diagnostic.setloclist, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  -- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  -- client.server_capabilities.documentFormattingProvider = true
end

-- vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
--   vim.lsp.diagnostic.on_publish_diagnostics, {
--     -- Disable signs
--     -- signs = false,
--   }
-- )

local signs = {
  { name = "DiagnosticSignError", text = "" },
  { name = "DiagnosticSignWarn", text = "" },
  { name = "DiagnosticSignHint", text = "" },
  { name = "DiagnosticSignInfo", text = "" }
}

for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

local config = {
  virtual_text = true,
  -- show signs
  signs = {
    active = signs,
  },
  update_in_insert = false,
  underline = true,
  severity_sort = true,
  float = {
    focus = false,
    focusable = false,
    style = "minimal",
    border = "rounded",
    source = "never",
    -- header = "",
    -- prefix = "",
  },
}

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
 config
 -- border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
 config
 -- border = "rounded",
})

vim.diagnostic.config(config)

-- local runtime_path = vim.split(package.path, ';')
-- table.insert(runtime_path, "lua/?.lua")
-- table.insert(runtime_path, "lua/?/init.lua")
-- require'lspconfig'.sumneko_lua.setup {
--   settings = {
--     Lua = {
--       runtime = {
--         -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
--         version = 'LuaJIT',
--         -- Setup your lua path
--         path = runtime_path,
--       },
--       diagnostics = {
--         -- Get the language server to recognize the `vim` global
--         globals = {'vim'},
--       },
--       workspace = {
--         -- Make the server aware of Neovim runtime files
--         library = vim.api.nvim_get_runtime_file("", true),
--       },
--       -- Do not send telemetry data containing a randomized but unique identifier
--       telemetry = {
--         enable = false,
--       },
--     },
--   },
--   on_attach = custom_lsp_attach
-- }

local yd_root_pattern = function (x)
  local git_root = util.root_pattern(".git")(x)
  if git_root then
    return git_root .. "/yd"
  else
    return util.root_pattern("project.clj", "deps.edn", "build.boot", "shadow-cljs.edn", "bb.edn")
  end
end

require'lspconfig'.clojure_lsp.setup{
  cmd = { "clojure-lsp" },
  filetypes = { "clojure", "edn" },
  root_dir = yd_root_pattern,
  on_attach = function (client, bufnr) client.server_capabilities.completionProvider = false; custom_lsp_attach(client, bufnr); end,
}

require'lspconfig'.eslint.setup{
  cmd = { "vscode-eslint-language-server", "--stdio" },
  filetypes = {"javascript"},
  -- cmd = { "eslint", "--stdin" },
  settings = {
    -- for eslint, should be ignored by other language servers
    packageManager = "yarn"
  },
  -- formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}",
  codeAction = {
    disableRuleComment = {
      enable = false,
      location = "separateLine"
    },
    showDocumentation = {
      enable = true
    }
  },
  -- packageManager = "yarn",
  -- on_init = function(client, initialize_result) client.resolved_capabilities.document_formatting = true; end,
  on_attach = custom_lsp_attach
}

require'lspconfig'.tsserver.setup{
  filetypes = {"typescript", "javascript"},
  -- client.server_capabilities.documentFormattingProvider = false
  on_attach = function(client, bufnr) client.server_capabilities.documentFormattingProvider = false; custom_lsp_attach(client, bufnr); end
}

require'lspconfig'.jsonls.setup{
  on_attach = custom_lsp_attach
}
require'lspconfig'.lua_ls.setup {
  on_attach = custom_lsp_attach,
  root_dir = util.root_pattern(".luarc.json", ".luarc.jsonc", ".luacheckrc", ".stylua.toml", "stylua.toml", "selene.toml", "selene.yml", ".git"),
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}
require'lspconfig'.graphql.setup{
  on_attach = custom_lsp_attach
}


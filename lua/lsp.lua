local function lsp_map(binding, command)
  local full_command = '<cmd>lua vim.' .. command .. '<cr>'
  vim.api.nvim_buf_set_keymap(0, 'n', binding, full_command, {noremap = true, silent = true})
end

local custom_lsp_attach = function(client)
  lsp_map('<C-k>', 'lsp.buf.code_action()')
  lsp_map('<Leader>p', 'lsp.buf.formatting()')
  lsp_map('<Leader>rn', 'lsp.buf.rename()')
  lsp_map('K', 'lsp.buf.hover()')
  -- lsp_map('K', 'lsp.buf.signature_help()')
  lsp_map('gD', 'lsp.buf.declaration()')
  lsp_map('gI', 'lsp.buf.implementation()')
  lsp_map('gd', 'lsp.buf.definition()')
  lsp_map('ge', 'diagnostic.setloclist()')
  lsp_map('gr', 'lsp.buf.references()')
  vim.api.nvim_buf_set_option(0, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    -- Disable signs
    -- signs = false,
  }
)

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
  update_in_insert = true,
  underline = true,
  severity_sort = true,
  float = {
    focus = false,
    focusable = false,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
}

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
 border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
 border = "rounded",
})

vim.diagnostic.config(config)

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")
require'lspconfig'.sumneko_lua.setup {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
  on_attach = custom_lsp_attach
}

require'lspconfig'.clojure_lsp.setup{
  cmd = { "clojure-lsp" },
  -- cmd = { "kondo" },
  filetypes = { "clojure", "edn" },
  -- root_dir = root_pattern("project.clj", "deps.edn", "build.boot", "shadow-cljs.edn", ".git")
  on_attach = custom_lsp_attach
}

require'lspconfig'.eslint.setup{
  cmd = { "vscode-eslint-language-server", "--stdio" },
  -- cmd = { "eslint", "--stdin" },
  settings = {
    -- for eslint, should be ignored by other language servers
    packageManager = "yarn"
  },
  -- packageManager = "yarn",
  -- on_init = function(client, initialize_result)
  --   client.resolved_capabilities.document_formatting = true
  -- end
  on_attach = custom_lsp_attach
}

require'lspconfig'.tsserver.setup{
  on_attach = custom_lsp_attach
}

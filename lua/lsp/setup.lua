-- let g:LanguageClient_serverCommands = {
--   'rust': ['rust-analyzer'],}

local lspconfig = require('lspconfig')
local lsp_installer = require("nvim-lsp-installer")

vim.lsp.set_log_level("debug")
print(vim.inspect(vim.lsp))

-- local on_attach = function(client)
--   require'completion'.on_attach(client)
-- end

lsp_installer.settings({
  ui = {
      icons = {
          server_installed = "✓",
          server_pending = "➜",
          server_uninstalled = "✗"
      }
  }
})

lspconfig.rust_analyzer.setup({
  -- on_attach=on_attach,
  settings = {
      ["rust-analyzer"] = {
          assist = {
              importGranularity = "module",
              importPrefix = "by_self",
          },
          cargo = {
              loadOutDirsFromCheck = true
          },
          procMacro = {
              enable = true
          },
      }
  }
})
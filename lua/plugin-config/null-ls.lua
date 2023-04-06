local status, null_ls = pcall(require, "null-ls")
if (not status) then return end

--local diagnostics = null_ls.builtins.diagnostics
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
--local augroup_format = vim.api.nvim_create_augroup("Format", { clear = true })

null_ls.setup({
    sources = {
        --[[
        null_ls.builtins.diagnostics.eslint_d.with({
            diagnostics_format = '[eslint]\n #{m}\n(#{c})'
        }),
        --]]
        null_ls.builtins.diagnostics.fish,
        null_ls.builtins.formatting.prettierd,
    },
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds { buffer = bufnr, group = augroup }
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({
                        --async = true, 这个不能用async
                        bufnr = bufnr,
                        filter = function(c)
                            return c.name == "null-ls"
                        end
                    })
                end
            })
        end
    end,
})

-- Auto commands
--vim.cmd([[ autocmd BufWritePre <buffer> lua vim.lsp.buf.format { async = true, buffer = buffer } ]])

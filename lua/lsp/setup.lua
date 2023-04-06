local status, mason = pcall(require, "mason")
if not status then
    vim.notify("没有找到 mason")
    return
end

local status, lspconfig = pcall(require, "lspconfig")
if not status then
    vim.notify("没有找到 lspconfig")
    return
end

local status, mason_config = pcall(require, "mason-lspconfig")
if not status then
    vim.notify("没有找到 mason-lspconfig")
    return
end

-- :h mason-default-settings
mason.setup({
    ui = {
        icons = {
            package_installed = "✅",
            package_pending = "➜",
            package_uninstalled = "✗",
        },
    },
})

-- mason-lspconfig uses the `lspconfig` server names in the APIs it exposes - not `mason.nvim` package names
-- https://github.com/williamboman/mason-lspconfig.nvim/blob/main/doc/server-mapping.md
mason_config.setup({
    -- 确保安装，根据需要填写
    ensure_installed = {
        "lua_ls",
        "tsserver",
        "tailwindcss",
        "cssls",
        "html",
        "jsonls",
        --"rust_analyzer",
    },
})

local tsserver_opt = require("lsp.config.ts")

mason_config.setup_handlers({
    function(server_name)
        require("lspconfig")[server_name].setup {}
    end,
    -- Next, you can provide targeted overrides for specific servers.
    ["lua_ls"] = function()
        lspconfig.lua_ls.setup {
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" }
                    }
                }
            },
            on_attach = function(client, bufnr)
                -- 禁用格式化功能，交给专门插件插件处理
                client.server_capabilities.document_formatting = false
                client.server_capabilities.document_range_formatting = false

                local function buf_set_keymap(...)
                    vim.api.nvim_buf_set_keymap(bufnr, ...)
                end
                -- 绑定快捷键
                require('keybindings').mapLSP(buf_set_keymap)
                -- 保存时自动格式化
                vim.cmd('autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()')
            end,

        }
    end,
    ["tsserver"] = function()
        lspconfig.tsserver.setup(tsserver_opt)
    end
})



--[[
local servers = {
  tsserver = require("lsp.config.ts"),
  lua_ls = require("lsp.config.lua"),
}

for name, config in pairs(servers) do
  if config ~= nil and type(config) == "table" then
    -- 自定义初始化配置文件必须实现on_setup 方法
    config.on_setup(lspconfig[name])
  else
    -- 使用默认参数
    lspconfig[name].setup({})
  end
end

--]]

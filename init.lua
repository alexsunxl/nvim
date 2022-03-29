-- 基础配置
require("basic")
-- 快捷键映射
require("keybindings")
-- Packer插件管理
require("plugins")

-- 插件配置
require("plugin-config.project")
require("plugin-config.nvim-treesitter")
require("plugin-config.nvim-tree")


-- LSP
require("lsp.setup")
require("lsp.ui")
-- vim.wo.number = true

-- local packer = require 'packer'

-- packer.startup(function()
-- 	-- body
-- 	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
-- end)
-- packer.init { disable_commands = true }
-- local use = packer.use
-- packer.reset()
-- print(vim.inspect(use))

-- use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

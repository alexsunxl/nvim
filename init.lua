vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- 使用相对行号
vim.wo.number = true
vim.wo.relativenumber = true

-- 显示左侧图标指示列
vim.wo.signcolumn = "yes"

-- 缩进2个空格等于一个Tab
vim.o.tabstop = 4
vim.bo.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftround = true

-- >> << 时移动长度
vim.o.shiftwidth = 4
vim.bo.shiftwidth = 4
-- 空格替代tab
vim.o.expandtab = true
vim.bo.expandtab = true


-- 搜索大小写不敏感，除非包含大写
vim.o.ignorecase = true
vim.o.smartcase = true

-- 搜索不要高亮
vim.o.hlsearch = false
-- 边输入边搜索
vim.o.incsearch = true
-- 命令行高为2，提供足够的显示空间
vim.o.cmdheight = 2

-- 补全增强
vim.o.wildmenu = true

-- 使用增强状态栏插件后不再需要 vim 的模式提示
vim.o.showmode = false


-- Packer 插件管理
require("plugins")

-- keys
require("keybindings")
require("colorscheme")

-- 插件配置
require("plugin-config.nvim-tree")
require("plugin-config.lualine")
require("plugin-config.telescope")
require("plugin-config.nvim-treesitter")
require("plugin-config.null-ls")
require("plugin-config.nvim-autopairs")
require("plugin-config.nvim-ts-autotag")


-- LSP
require("lsp.setup")
require("lsp.cmp")


-- symbol in right
require("symbols-outline").setup()

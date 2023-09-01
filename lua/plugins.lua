local packer = require("packer")
packer.startup(
    function(use)
        -- Packer 可以管理自己本身
        use 'wbthomason/packer.nvim'

        use("folke/tokyonight.nvim")
        use({ "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons" })
        use { 'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons' }
        use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
        use({ 'nvim-telescope/telescope.nvim', requires = { "nvim-lua/plenary.nvim" } })
        use 'nvim-telescope/telescope-file-browser.nvim'

        -- treesitter
        use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

        --
        use { 'simrat39/symbols-outline.nvim' }
        use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
        use 'MunifTanjim/prettier.nvim'       -- Prettier plugin for Neovim's built-in LSP client

        use 'windwp/nvim-autopairs'
        use 'windwp/nvim-ts-autotag'
        use 'kylechui/nvim-surround'

        -- 快速注释
        use 'numToStr/Comment.nvim'
        use 'JoosepAlviste/nvim-ts-context-commentstring'


        -- lsp config
        use({ "williamboman/mason.nvim" })
        use({ "williamboman/mason-lspconfig.nvim" })

        -- Lspconfig
        use({ "neovim/nvim-lspconfig" })
        --
        --
        -- 补全引擎
        use("hrsh7th/nvim-cmp")
        use("hrsh7th/cmp-buffer")
        use("hrsh7th/cmp-path")
        use("hrsh7th/cmp-cmdline")


        -- snippet 引擎
        use("hrsh7th/vim-vsnip")
        -- 补全源
        use("hrsh7th/cmp-vsnip")
        use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }

        use({ "jose-elias-alvarez/nvim-lsp-ts-utils", requires = "nvim-lua/plenary.nvim" })


        -- lua run
        use 'rafcamlet/nvim-luapad'
    end)

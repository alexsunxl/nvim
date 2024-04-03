local vim = vim
local opt = vim.opt


-- za: 折叠当前行
-- zo: 打开当前行折叠
-- zc: 折叠所有行
-- zo: 打开所有折叠
-- zR: 递归折叠
-- zO: 递归打开
--
-- fold
-- https://www.jmaguire.tech/posts/treesitter_folding/
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldenable = false

local status, autopairs = pcall(require, "nvim-autopairs")
if not status then
    vim.notify("没有找到 nvim-autopairs")
    return
end



autopairs.setup({
    --[[
Before        Input                    After
--------------------------------------------------
(|foobar      <M-e> then press $        (|foobar)
(|)(foobar)   <M-e> then press q       (|(foobar))
    --]]
    fast_wrap = {
        map = '<M-e>',
        chars = { '{', '[', '(', '"', "'" },
        pattern = [=[[%'%"%>%]%)%}%,]]=],
        end_key = '$',
        keys = 'qwertyuiopzxcvbnmasdfghjkl',
        check_comma = true,
        highlight = 'Search',
        highlight_grey = 'Comment'
    },
})

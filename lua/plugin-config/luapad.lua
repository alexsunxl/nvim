local status, luapad = pcall(require, "luapad")
if not status then
    vim.notify("没有找到 luapad")
    return
end


luapad.setup {
    count_limit = 150000,
    error_indicator = false,
    eval_on_move = true,
    error_highlight = 'WarningMsg',
    split_orientation = 'horizontal',
    on_init = function()
        print 'Hello from Luapad!'
    end,
}

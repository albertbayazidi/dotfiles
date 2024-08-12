function FoldExpr()
    local line = vim.fn.getline(vim.v.lnum)
    if #line > 120 then
        return '1'
    end
    return vim.treesitter.foldexpr()
end

function FoldText()
    local line = vim.fn.getline(vim.v.foldstart)
    local sub = line:gsub('/%*', ''):gsub('%*/', ''):gsub('{{{%d=', '')
    return  sub
end

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.FoldExpr()"

vim.opt.foldtext = 'v:lua.FoldText()'
vim.opt.fillchars = { fold = ' ' }
vim.opt.foldcolumn = "0"
vim.opt.foldlevel = 99

local enhancements_group = vim.api.nvim_create_augroup("MyEnhancements", { clear = true })

-- [[ Highlight on yank ]]
vim.api.nvim_create_autocmd('TextYankPost', {
    group = enhancements_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- [[ Retain cursor position ]]
vim.api.nvim_create_autocmd("BufReadPost", {
    group = enhancements_group,
    pattern = '*',
    callback = function()
        if vim.fn.line("'\"") > 0 and vim.fn.line("'\"") <= vim.fn.line("$") then
            vim.cmd("normal! g`\"")
        end
    end,
})

-- [[ Automatically remove trailing whitespaces ]]
vim.api.nvim_create_autocmd("BufWritePre", {
    group = enhancements_group,
    pattern = "*",
    callback = function()
        vim.cmd("%s/\\s\\+$//e")
    end,
})

-- [[ Auto format upon save ]]
vim.api.nvim_create_autocmd("BufWritePre", {
    group = enhancements_group,
    pattern = "*",
    callback = function()
        if vim.lsp.buf.server_ready() then
            vim.lsp.buf.format({ async = true })
        end
    end,
})

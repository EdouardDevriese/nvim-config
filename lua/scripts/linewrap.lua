local augroupName = "WritingPrep"
vim.api.nvim_create_augroup(augroupName, { clear = true })
-- Autocommand to set key mappings for Markdown and Text files
vim.api.nvim_create_autocmd("FileType", {
    group = augroupName,
    pattern = {"markdown", "text"},
    callback = function()
        -- Normal and Visual mode mappings for visual line navigation
        vim.api.nvim_buf_set_keymap(0, 'n', '<Up>', 'gk', {noremap = true, silent = true})
        vim.api.nvim_buf_set_keymap(0, 'n', '<Down>', 'gj', {noremap = true, silent = true})
        vim.api.nvim_buf_set_keymap(0, 'v', '<Up>', 'gk', {noremap = true, silent = true})
        vim.api.nvim_buf_set_keymap(0, 'v', '<Down>', 'gj', {noremap = true, silent = true})
        -- Insert mode mappings for visual line navigation
        vim.api.nvim_buf_set_keymap(0, 'i', '<Up>', '<C-o>gk', {noremap = true, silent = true})
        vim.api.nvim_buf_set_keymap(0, 'i', '<Down>', '<C-o>gj', {noremap = true, silent = true})
        -- Enable line wrap
        vim.opt_local.wrap = true
    end,
})

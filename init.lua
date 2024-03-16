require("set")
require("remap")

require("plugins.plugins")
require("plugins.treesitter")
require("plugins.telescope")
require("plugins.harpoon")
require("plugins.lsp")
require("plugins.cmp")

require("cpp_classes")

-- [[ Highlight on yank ]]
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

local enhancements_group = vim.api.nvim_create_augroup("MyEnhancements", { clear = true })
-- [[ Retain cursor position ]]
vim.api.nvim_create_autocmd("BufReadPost", {
  group = enhancements_group,
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

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

vim.cmd[[colorscheme tokyonight]]

-- vim: ts=2 sts=2 sw=2 et

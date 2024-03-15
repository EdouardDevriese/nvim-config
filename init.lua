require("set")
require("remap")
require("plugins.plugins")

require("plugins.treesitter")
require("plugins.telescope")
require("plugins.harpoon")
require("plugins.lsp")
require("plugins.cmp")

-- [[ Highlight on yank ]]
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

-- vim: ts=2 sts=2 sw=2 et

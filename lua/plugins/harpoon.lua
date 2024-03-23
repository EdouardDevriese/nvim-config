-- [[Configure harpoon ]]
vim.keymap.set('n', '<leader>a', require('harpoon.mark').add_file, {desc = 'Mark File'})
vim.keymap.set('n', '<leader>m', require('harpoon.ui').toggle_quick_menu, {desc = 'Harpoon Menu'})
-- vim.keymap.set('n', '<C-t>', function() require('harpoon.ui').nav_file(1) end, {desc = 'Harpoon Nav 1'})
-- vim.keymap.set('n', '<C-s>', function() require('harpoon.ui').nav_file(2) end, {desc = 'Harpoon Nav 2'})
-- vim.keymap.set('n', '<C-r>', function() require('harpoon.ui').nav_file(3) end, {desc = 'Harpoon Nav 3'})
-- vim.keymap.set('n', '<C-a>', function() require('harpoon.ui').nav_file(4) end, {desc = 'Harpoon Nav 4'})
vim.keymap.set('n', '<C-t>', function() require('harpoon.ui').nav_next() end, {desc = 'Harpoon Nav Next'})
vim.keymap.set('n', '<C-s>', function() require('harpoon.ui').nav_prev() end, {desc = 'Harpoon Nav Prev'})

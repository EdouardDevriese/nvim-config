require('obsidian').setup({
    opts = {
        workspaces = {
            {
                name = "notes",
                path = "~/Notes",
            }
        }
    },
    completion = {
        -- set to false to disable completion.
        nvim_cmp = true,
        -- trigger completion at 2 chars.
        min_chars = 2,
    },
    ui = {
        enable = true,         -- set to false to disable all additional syntax features
        update_debounce = 200, -- update delay after a text change (in milliseconds)
        checkboxes = {
            -- note: the 'char' value has to be a single character, and the highlight groups are defined below.
            [" "] = { char = "󰄱", hl_group = "obsidiantodo" },
            ["x"] = { char = "", hl_group = "obsidiandone" },
            [">"] = { char = "", hl_group = "obsidianrightarrow" },
            ["~"] = { char = "󰰱", hl_group = "obsidiantilde" },
        },
        -- use bullet marks for non-checkbox lists.
        bullets = { char = "•", hl_group = "obsidianbullet" },
        external_link_icon = { char = "", hl_group = "obsidianextlinkicon" },
        reference_text = { hl_group = "obsidianreftext" },
        highlight_text = { hl_group = "obsidianhighlighttext" },
        tags = { hl_group = "obsidiantag" },
        block_ids = { hl_group = "obsidianblockid" },
        hl_groups = {
            -- the options are passed directly to `vim.api.nvim_set_hl()`. see `:help nvim_set_hl`.
            obsidiantodo = { bold = true, fg = "#f78c6c" },
            obsidiandone = { bold = true, fg = "#89ddff" },
            obsidianrightarrow = { bold = true, fg = "#f78c6c" },
            obsidiantilde = { bold = true, fg = "#ff5370" },
            obsidianbullet = { bold = true, fg = "#89ddff" },
            obsidianreftext = { underline = true, fg = "#c792ea" },
            obsidianextlinkicon = { fg = "#c792ea" },
            obsidiantag = { italic = true, fg = "#89ddff" },
            obsidianblockid = { italic = true, fg = "#89ddff" },
            obsidianhighlighttext = { bg = "#75662e" },
        },
    },
})

-- Open a note in the Obsidian app
vim.keymap.set('n', '<leader>oo', ':ObsidianOpen<CR>', { desc = 'Open current note in Obsidian' })
vim.keymap.set('n', '<leader>oO', ':ObsidianOpen ', { desc = 'Open a note in Obsidian by query' })
-- Create a new note
vim.keymap.set('n', '<leader>on', ':ObsidianNew<CR>', { desc = 'Create a new note with prompt for title' })
vim.keymap.set('n', '<leader>oN', ':ObsidianNew ', { desc = 'Create a new note with given title' })
-- Quickly switch to another note
vim.keymap.set('n', '<leader>oq', ':ObsidianQuickSwitch<CR>', { desc = 'Quickly switch to another note' })
-- Follow a link
vim.keymap.set('n', '<leader>of', ':ObsidianFollowLink<CR>', { desc = 'Follow link under cursor in same window' })
vim.keymap.set('n', '<leader>oF', ':ObsidianFollowLink vsplit<CR>',
    { desc = 'Follow link under cursor in vertical split' })
-- Backlinks
vim.keymap.set('n', '<leader>ob', ':ObsidianBacklinks<CR>', { desc = 'Show backlinks to current note' })
-- Tags
vim.keymap.set('n', '<leader>ot', ':ObsidianTags ', { desc = 'List occurrences of tags' })
-- Search
vim.keymap.set('n', '<leader>os', ':ObsidianSearch ', { desc = 'Search notes in vault' })
-- Link
vim.keymap.set('v', '<leader>ol', ':ObsidianLink<CR>', { desc = 'Link selected text to a note' })
vim.keymap.set('v', '<leader>oL', ':ObsidianLink ', { desc = 'Link selected text to a note by query' })
-- Link and create new note
vim.keymap.set('v', '<leader>oc', ':ObsidianLinkNew<CR>',
    { desc = 'Create and link new note with selected text as title' })
vim.keymap.set('v', '<leader>oC', ':ObsidianLinkNew ', { desc = 'Create and link new note with given title' })
-- List links
vim.keymap.set('n', '<leader>oll', ':ObsidianLinks<CR>', { desc = 'List all links in current note' })
-- Extract note
vim.keymap.set('v', '<leader>oe', ':ObsidianExtractNote<CR>',
    { desc = 'Extract selected text into a new note and link it' })
-- Workspace
vim.keymap.set('n', '<leader>ow', ':ObsidianWorkspace ', { desc = 'Switch to another workspace' })
-- Paste image
vim.keymap.set('n', '<leader>op', ':ObsidianPasteImg ', { desc = 'Paste image from clipboard into note' })
-- Rename note
vim.keymap.set('n', '<leader>or', ':ObsidianRename<CR>', { desc = 'Rename current note with prompt for new name' })
vim.keymap.set('n', '<leader>oR', ':ObsidianRename ',
    { desc = 'Rename current note or reference under cursor with new name' })

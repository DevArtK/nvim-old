require('kommentary.config').use_extended_mappings()

require('kommentary.config').configure_language("default", {
    prefer_single_line_comments = true,
})
vim.g.kommentary_create_default_mappings = false
vim.api.nvim_set_keymap("n", "<leader>cc", "<Plug>kommentary_line_default", {})
vim.api.nvim_set_keymap("n", "<leader>c", "<Plug>kommentary_motion_default", {})
vim.api.nvim_set_keymap("x", "<leader>cc", "<Plug>kommentary_visual_default", {})

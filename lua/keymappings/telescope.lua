
H.map('n', '<leader>ff', [[<cmd>lua require('telescope.builtin').file_browser()<CR>]], opts)

H.map('n', '<leader>fF', [[<cmd>lua require('telescope.builtin').find_files({previewer = true})<CR>]], opts)


H.map('n', '<leader>fb', [[<cmd>lua require('telescope.builtin').buffers()<CR>]], opts)

H.map('n', '<leader>fB', [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]], opts)


H.map('n', '<leader>lg', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]], opts)

H.map('n', '<leader>so', [[<cmd>lua require('telescope.builtin').tags{ only_current_buffer = true }<CR>]], opts)

-- Search references to symbol under cursor
H.map("n", "<Leader>fr", [[<cmd>lua require('telescope.builtin').lsp_references()<CR>]], opts)

-- checkout different branches
H.map("n", "<Leader>gc", [[<cmd>lua require('telescope.builtin').git_branches()<CR>]], opts)

-- checkout commits; <CR> to checkout, <C-r>[m, s, h] to reset [mixed, soft, hard]
H.map("n", "<Leader>re", [[<cmd>lua require<('telescope.builtin').git_commits()<CR>]], opts)

H.map("n", "<Leader>co", [[<cmd>lua require('telescope.builtin').colorscheme()<CR>]], opts)

H.map("n", "<Leader>cm", [[<cmd>lua require('telescope.builtin').commands()<CR>]], opts)

H.map("n", "<Leader>qf", [[<cmd>lua require('telescope.builtin').quickfix()<CR>]], opts)

H.map("n", "<Leader>fh", [[<cmd>lua require('telescope.builtin').help_tags()<CR>]], opts)

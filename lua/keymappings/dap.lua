
-- DAP
H.map('n', '<leader>dct', '<cmd>lua require"dap".continue()<CR>')
H.map('n', '<leader>dsv', '<cmd>lua require"dap".step_over()<CR>')
H.map('n', '<leader>dsi', '<cmd>lua require"dap".step_into()<CR>')
H.map('n', '<leader>dso', '<cmd>lua require"dap".step_out()<CR>')
H.map('n', '<leader>dtb', '<cmd>lua require"dap".toggle_breakpoint()<CR>')


-- DAP-UI
H.map('n', '<leader>dsc', '<cmd>lua require"dap.ui.variables".scopes()<CR>')
H.map('n', '<leader>dhh', '<cmd>lua require"dap.ui.variables".hover()<CR>')
H.map('v', '<leader>dhv',
          '<cmd>lua require"dap.ui.variables".visual_hover()<CR>')

H.map('n', '<leader>duh', '<cmd>lua require"dap.ui.widgets".hover()<CR>')
H.map('n', '<leader>duf',
          "<cmd>lua local widgets=require'dap.ui.widgets';widgets.centered_float(widgets.scopes)<CR>")
H.map('n', '<leader>dui', '<cmd>lua require"dapui".toggle()<CR>')

H.map('n', '<leader>dsbr',
          '<cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>')
H.map('n', '<leader>dsbm',
          '<cmd>lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>')
H.map('n', '<leader>dro', '<cmd>lua require"dap".repl.open()<CR>')
H.map('n', '<leader>drl', '<cmd>lua require"dap".repl.run_last()<CR>')


-- telescope-dap
H.map('n', '<leader>dcc',
          '<cmd>lua require"telescope".extensions.dap.commands{}<CR>')
H.map('n', '<leader>dco',
          '<cmd>lua require"telescope".extensions.dap.configurations{}<CR>')
H.map('n', '<leader>dlb',
          '<cmd>lua require"telescope".extensions.dap.list_breakpoints{}<CR>')
H.map('n', '<leader>dv',
          '<cmd>lua require"telescope".extensions.dap.variables{}<CR>')
H.map('n', '<leader>df',
          '<cmd>lua require"telescope".extensions.dap.frames{}<CR>')

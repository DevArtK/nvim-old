local handlers = vim.lsp.handlers

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {

    underline = false,	-- Enable underline, use default values

    virtual_text = {
      spacing = 4,	-- Enable virtual text, override spacing to 4
      prefix = '',
      --prefix = '~',
	  severity_limit = "Warning"
    },
    -- Use a function to dynamically turn signs off
    -- and on, using buffer local variables
    signs = function(bufnr, client_id)
      local ok, result = pcall(vim.api.nvim_buf_get_var, bufnr, 'show_signs')
      -- No buffer local variable set, so just enable by default
      if not ok then
        return true
      end

      return result
    end,
    -- Disable a feature
    update_in_insert = true,	-- Live diagnostic as you type if true, on exit if false
  }
)

-- vim.fn.sign_define("LspDiagnosticsSignError",
--     {text = "", texthl = "LspDiagnosticsError"})

H.fn.sign_define("LspDiagnosticsSignError",
    {text = "", texthl = "LspDiagnosticsDefaultError"})

H.fn.sign_define("LspDiagnosticsSignWarning",
    {text = "", texthl = "LspDiagnosticsDefaultWarning"})

H.fn.sign_define("LspDiagnosticsSignInformation",
    {text = "", texthl = "LspDiagnosticsDefaultInformation"})

H.fn.sign_define("LspDiagnosticsSignHint",
    {text = "", texthl = "LspDiagnosticsDefaultHint"})


-- =======
-- DEFAULT
-- =======

--vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  --vim.lsp.diagnostic.on_publish_diagnostics, {
    -- This will disable virtual text, like doing:
    -- let g:diagnostic_enable_virtual_text = 0
    --virtual_text = true,

    -- This is similar to:
    -- let g:diagnostic_show_sign = 1
    -- To configure sign display,
    --  see: ":help vim.lsp.diagnostic.set_signs()"
    --signs = true,

    -- This is similar to:
    -- "let g:diagnostic_insert_delay = 1"
    --update_in_insert = true,
  --}
--)

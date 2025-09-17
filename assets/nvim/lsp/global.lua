local function configure_diagnostics()
  vim.diagnostic.config {
    virtual_lines = true,
    virtual_text = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
      border = 'rounded',
      source = true,
    },
    signs = {
      text = {
        [vim.diagnostic.severity.ERROR] = '󰅚 ',
        [vim.diagnostic.severity.WARN] = '󰀪 ',
        [vim.diagnostic.severity.INFO] = '󰋽 ',
        [vim.diagnostic.severity.HINT] = '󰌶 ',
      },
    },
  }
end

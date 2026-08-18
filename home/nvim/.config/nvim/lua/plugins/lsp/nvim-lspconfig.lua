return {
  {
    'neovim/nvim-lspconfig',
    opts = function(_, opts)
      opts.diagnostics.virtual_text = vim.tbl_extend('force', opts.diagnostics.virtual_text or {}, {
        position = 'below',
      })
    end,
  },
}

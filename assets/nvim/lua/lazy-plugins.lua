require('lazy').setup({
  spec = {
    { "folke/lazy.nvim", version = false },
    { 'LazyVim/LazyVim', import = 'lazyvim.plugins', opts = { colorscheme = "tokyonight" }, version = false },
    { import = 'plugins' },
  },
})

-- vim: ts=2 sts=2 sw=2 et

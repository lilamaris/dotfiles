require('lazy').setup({
  spec = {
    { 'LazyVim/LazyVim', import = 'lazyvim.plugins' },
    { import = 'plugins' },
  },
}, {
  ui = {
    icons = {},
  },
})

-- vim: ts=2 sts=2 sw=2 et

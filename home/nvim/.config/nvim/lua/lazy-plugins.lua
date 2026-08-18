require('lazy').setup {
  spec = {
    { 'LazyVim/LazyVim',        import = 'lazyvim.plugins' },
    { import = 'plugins.lsp' },
    { import = 'plugins.editor' },
    { import = 'plugins.visual' },
  },
  defaults = {
    lazy = false,
    version = false,
  },
  checker = {
    enabled = true,
    notify = false,
  },
}

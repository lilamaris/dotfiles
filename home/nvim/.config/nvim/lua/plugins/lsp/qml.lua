return {
  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        ['qml-language-server'] = {
          cmd = { 'qml-language-server' },
          filetypes = { 'qml' },
          root_markers = { { 'qmldir', 'shell.qml' }, '.git' },
          mason = false,
        },
      },
    },
  },
}

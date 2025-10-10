return {
  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        tailwindcss = {
          filetypes_include = { 'astro' },
          filetypes_exclude = { 'markdown' },
          settings = {
            tailwindCSS = {
              includeLanguages = { astro = 'html' },
              -- tailwindcss v4
              experimental = {
                configFile = {
                  ['src/styles/global.css'] = 'src/**',
                },
              },
              classAttributes = { 'class', 'className', 'class:list', 'classList', 'ngClass' },
              validate = true,
            },
          },
        },
      },
      setup = {
        tailwindcss = function(_, opts)
          opts.filetypes = opts.filetypes or {}
          vim.list_extend(opts.filetypes, vim.lsp.config.tailwindcss.filetypes or {})
          opts.filetypes = vim.tbl_filter(function(ft)
            return not vim.tbl_contains(opts.filetypes_exclude or {}, ft)
          end, opts.filetypes)
          vim.list_extend(opts.filetypes, opts.filetypes_include or {})
        end,
      },
    },
  },
}

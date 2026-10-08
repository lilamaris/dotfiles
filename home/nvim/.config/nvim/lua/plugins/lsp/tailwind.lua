return {
  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        tailwindcss = {
          filetypes_include = { 'astro', 'svelte' },
          filetypes_exclude = { 'markdown' },
          settings = {
            tailwindCSS = {
              includeLanguages = { astro = 'html' },
              -- Let the language server discover each project's Tailwind v3
              -- config or v4 CSS entry point. A fixed configFile path makes
              -- other project layouts (for example SvelteKit's src/app.css)
              -- attach successfully but return no completions.
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

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Autocmd group for the diagnostic autocmds below (name is arbitrary; lets them be cleared/re-registered as one)
local group = vim.api.nvim_create_augroup('OoO', {})

-- Helper: register an autocmd in `group`; a function becomes a `callback`, a string an ex `command`
local function au(typ, pattern, cmdOrFn)
  if type(cmdOrFn) == 'function' then
    vim.api.nvim_create_autocmd(typ, { pattern = pattern, callback = cmdOrFn, group = group })
  else
    vim.api.nvim_create_autocmd(typ, { pattern = pattern, command = cmdOrFn, group = group })
  end
end

-- Open a float with diagnostics for the line under the cursor
--  Triggered when the cursor idles (`CursorHold`) or when leaving insert mode (`InsertLeave`)
--  Non-focusable float, cursor-scope only, auto-closes on `BufLeave` / `CursorMoved` / `InsertEnter`
au({ 'CursorHold', 'InsertLeave' }, nil, function()
  local opts = {
    focusable = false,
    scope = 'cursor',
    close_events = { 'BufLeave', 'CursorMoved', 'InsertEnter' },
  }
  vim.diagnostic.open_float(nil, opts)
end)

-- Hide diagnostic signs while in insert mode (less visual noise while typing)
au('InsertEnter', nil, function()
  vim.diagnostic.enable(false)
end)

-- Re-enable diagnostic signs when leaving insert mode
au('InsertLeave', nil, function()
  vim.diagnostic.enable(true)
end)

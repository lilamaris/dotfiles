local options = {
  backup = false,
  fileencoding = "utf-8",
  hidden = true,
  ignorecase = true,
  showmode = false,
  smartcase = true,
  smartindent = true,
  splitbelow = true,
  splitright = true,
  splitkeep = "screen",
  scrolloff = 10,
  signcolumn = 'yes',
  breakindent = true,
  swapfile = true,
  timeoutlen = 500,
  undofile = true,
  updatetime = 100,
  writebackup = false,
  expandtab = true,
  shiftwidth = 2,
  tabstop = 2,
  cursorline = true,
  fillchars = { eob = " ", fold = " ", foldopen = "", foldsep = " ", foldclose = "", lastline = " " },
  list = false,
  listchars = { tab = '» ', trail = '·', nbsp = '␣' },
  inccommand = "split"
}

for name, value in pairs(options) do
  vim.opt[name] = value
end

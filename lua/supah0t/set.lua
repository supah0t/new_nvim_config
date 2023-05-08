local opt = vim.opt

opt.number = true
opt.relativenumber = true

opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true

opt.smartcase = true
opt.smarttab = true
opt.autoindent = true
opt.smartindent = true
opt.cindent = true
opt.swapfile = false
opt.autoread = true
vim.bo.autoread = true

opt.laststatus = 2
opt.showcmd = true

opt.signcolumn = 'yes'

opt.scrolloff = 10
opt.updatetime = 300

opt.hlsearch = true
opt.incsearch = true

opt.mouse = 'a'
opt.clipboard:append('unnamedplus')

opt.termguicolors = true
opt.wildmode = "longest,list:longest,full"

--doesn't work properly here
--local updatedFormat = opt.formatoptions - { 'c', 'r', 'o' }
--opt.formatoptions = updatedFormat

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter", "CursorHold" }, {
  buffer = vim.nvim_get_current_buf,
  command = "checktime",
})

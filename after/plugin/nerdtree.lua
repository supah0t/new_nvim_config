local key = vim.keymap

key.set('n', '<leader>n', ':NERDTreeToggle<cr>', { noremap = true })
key.set('n', '<leader>N', ':NERDTreeToggle %<cr>', { noremap = true })

vim.g.NERDTreeWinSize = 35

local builtin = require('telescope.builtin')

-- for neoformat (prettier) to use local prettier config
vim.g.neoformat_try_node_exe = 1
vim.keymap.set('n', '<leader>ap', ':Neoformat prettier<CR>')

local bufopts = { noremap = true, silent = true, buffer = bufnr }
vim.keymap.set('n', 'gde', function() builtin.lsp_definitions {} end, bufopts)
vim.keymap.set('n', 'gdv', function() builtin.lsp_definitions { jump_type = 'vsplit' } end, bufopts)
vim.keymap.set('n', 'gdt', function() builtin.lsp_definitions { jump_type = 'tab' } end, bufopts)
vim.keymap.set('n', 'gfr', function() builtin.lsp_references  {} end, bufopts)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
vim.keymap.set('n', '<leader>k', vim.lsp.buf.hover, bufopts)
vim.keymap.set('n', '<leader>K', '<cmd>Telescope lsp_document_symbols<cr>', bufopts)
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, bufopts)
vim.keymap.set('n', '<leader>ef', ':EslintFixAll<CR>')
vim.keymap.set('n', '<leader>af', function() vim.lsp.buf.format { timeout = 20000 } end)

vim.g.showDiagnostics = true

local diagnostics_active = true
local toggle_diagnostics = function()
  diagnostics_active = not diagnostics_active
  if diagnostics_active then
    vim.diagnostic.show()
    vim.g.showDiagnostics = true
    print('diagnostics: show')
  else
    vim.diagnostic.hide()
    vim.g.showDiagnostics = false
    print('diagnostics: hide')
  end
end

vim.keymap.set('n', '<leader>dt', toggle_diagnostics)

-- local on_attach = function(_, bufnr, _)
  -- local bufopts = { noremap = true, silent = true, buffer = bufnr }
  -- vim.keymap.set('n', 'gde', function() builtin.lsp_definitions {} end, bufopts)
  -- vim.keymap.set('n', 'gdv', function() builtin.lsp_definitions { jump_type = 'vsplit' } end, bufopts)
  -- vim.keymap.set('n', 'gdt', function() builtin.lsp_definitions { jump_type = 'tab' } end, bufopts)
  -- vim.keymap.set('n', 'gfr', function() builtin.lsp_references  {} end, bufopts)
  -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  -- vim.keymap.set('n', '<leader>k', vim.lsp.buf.hover, bufopts)
  -- vim.keymap.set('n', '<leader>K', '<cmd>Telescope lsp_document_symbols<cr>', bufopts)
  -- vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
  -- vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, bufopts)
  -- vim.keymap.set('n', '<leader>ef', ':EslintFixAll<CR>')
  -- vim.keymap.set('n', '<leader>af', function() vim.lsp.buf.format { timeout = 20000 } end)

  -- vim.g.showDiagnostics = true

  -- local diagnostics_active = true
  -- local toggle_diagnostics = function()
    -- diagnostics_active = not diagnostics_active
    -- if diagnostics_active then
      -- vim.diagnostic.show()
      -- vim.g.showDiagnostics = true
      -- print('diagnostics: show')
    -- else
      -- vim.diagnostic.hide()
      -- vim.g.showDiagnostics = false
      -- print('diagnostics: hide')
    -- end
  -- end

  -- vim.keymap.set('n', '<leader>dt', toggle_diagnostics)
-- end


-- vim.lsp.config('eslint', {
  -- on_attach = on_attach
-- })
vim.lsp.enable('eslint')

-- vim.lsp.config('ts_ls', {
  -- on_attach = on_attach
-- })
vim.lsp.enable('ts_ls')

-- vim.lsp.config('css_variables', {
  -- on_attach = on_attach
-- })
vim.lsp.enable('css_variables')
-- vim.lsp.config('somesass_ls', {
  -- on_attach = on_attach
-- })
vim.lsp.enable('somesass_ls')

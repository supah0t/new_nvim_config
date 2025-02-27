local builtin = require('telescope.builtin')


local on_attach = function(_, bufnr, _)
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
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local lsp_config = {
  capabilities = capabilities,
  group = vim.api.nvim_create_augroup('LspFormatting', { clear = true }),
  on_attach = function(_, bufnr)
    on_attach(_, bufnr)
  end
}

require('mason-lspconfig').setup_handlers({
  function(server_name)
    require('lspconfig')[server_name].setup(lsp_config)
  end,
  ['eslint'] = function()
    require('lspconfig').eslint.setup({
      -- remove comment to enable eslint --fix on save
      --on_attach = function(_, bufnr)
      --vim.api.nvim_create_autocmd("BufWritePre", {
      --buffer = bufnr,
      --command = "EslintFixAll",
      --})
      --end
    })
  end,
  ['lua_ls'] = function()
    require('lspconfig').lua_ls.setup(vim.tbl_extend('force', lsp_config, {
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' }
          }
        }
      }
    }))
  end,
  ["cssls"] = function ()
        require("lspconfig").cssls.setup(vim.tbl_deep_extend('force', lsp_config, {
            capabilities = {
                textDocument = {
                    completion= {
                        completionItem = { snippetSupport = true }
                    }
                }
            },
        }))
    end,
})

-- eslint plugin
require('nvim-eslint').setup({})

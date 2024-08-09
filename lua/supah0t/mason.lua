require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = {
    'lua_ls',
    'tsserver',
    'graphql',
    'tailwindcss'
  },
  automatic_installation = true
})

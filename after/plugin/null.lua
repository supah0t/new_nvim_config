local null_ls = require("null-ls")
local builtins = null_ls.builtins

null_ls.setup({
  sources = {
    --builtins.formatting.eslint,
    builtins.formatting.prettier,
    builtins.code_actions.eslint,
    builtins.diagnostics.eslint,
    --builtins.diagnostics.stylelint,
    --null_ls.builtins.diagnostics.tsc
  },
})

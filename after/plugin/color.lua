function GlobalColor(color)
  vim.cmd.colorscheme 'kanagawa'
  -- vim.cmd.colorscheme "catppuccin-latte"

  -- vim.api.nvim_set_hl(0, "Normal", {bg = "none" })
  -- vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none" })
  vim.api.nvim_set_hl(0, "VimwikiHeader1", { fg = "#db5063" })
  vim.api.nvim_set_hl(0, "VimwikiHeader2", { fg = "#87b059" })
  vim.api.nvim_set_hl(0, "VimwikiHeader3", { fg = "#fd8c53" })
  vim.api.nvim_set_hl(0, "VimwikiHeader4", { fg = "#69998d" })
  vim.api.nvim_set_hl(0, "VimwikiHeader5", { fg = "#dfb771" })
  vim.api.nvim_set_hl(0, "VimwikiHeader6", { fg = "#77713f" })

end

GlobalColor()

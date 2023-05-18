local showDiagnosticsTest = function ()
  if vim.g.showDiagnostics == nil or vim.g.showDiagnostics == false then
    return ''
  else
    return 'diagnostics'
  end
end

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'everforest',
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diff', 'filename' },
    lualine_c = { 'diagnostics' },
    lualine_x = { showDiagnosticsTest },
    lualine_y = { 'progress' },
    lualine_z = { 'location', 'filetype' }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {'nerdtree'}
}

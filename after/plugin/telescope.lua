local builtin = require('telescope.builtin')

function Actual_find_files()
  builtin.find_files {
    no_ignore = true
  }
end

function My_find_gitfiles()
  builtin.git_files {
    shorten_path = true,
  }
end

vim.keymap.set('n', '<leader>ff', Actual_find_files, {})
vim.keymap.set('n', '<leader>fg', My_find_gitfiles, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, { noremap = true })
vim.keymap.set('n', '<C-f>', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

require('nvim-web-devicons').setup({
  override = {},
  default = true
})

require('telescope').setup {
  defaults = {
    path_display = { 'smart' },
    mappings = {
      i = {
        ["<C-h>"] = "which_key"
      }
    }
  },
  layout_config = {
    horizontal = {
      preview_cutoff = 100,
      preview_width = 0.6
    }
  }
}

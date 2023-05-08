local builtin = require('telescope.builtin')
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

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

local mm = {
  ["<CR>"] = function(pb)
    local picker = action_state.get_current_picker(pb)
    local multi = picker:get_multi_selection()
    actions.select_default(pb) -- the normal enter behaviour
    for _, j in pairs(multi) do
      if j.path ~= nil then -- is it a file -> open it as well:
        vim.cmd(string.format("%s %s", "edit", j.path))
      end
    end
  end,
}

require('telescope').setup {
  defaults = {
    path_display = { 'smart' },
    mappings = {
      i = {
        ["<C-h>"] = "which_key",
        ["C-m"] = mm
      },
      n = {
        ["C-m"] = mm
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

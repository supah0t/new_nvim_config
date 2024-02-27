local builtin = require('telescope.builtin')
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local lga_actions = require("telescope-live-grep-args.actions")

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

local custom_actions = {}

function custom_actions.fzf_multi_select(prompt_bufnr)
  local picker = action_state.get_current_picker(prompt_bufnr)
  local num_selections = #(picker:get_multi_selection())

  if num_selections > 1 then
    -- actions.file_edit throws - context of picker seems to change
    --actions.file_edit(prompt_bufnr)
    actions.send_selected_to_qflist(prompt_bufnr)
    actions.open_qflist()
  else
    actions.file_edit(prompt_bufnr)
  end
end

vim.keymap.set('n', '<leader>ff', Actual_find_files, {})
vim.keymap.set('n', '<leader>fg', My_find_gitfiles, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, { noremap = true })
vim.keymap.set('n', '<leader>fd', builtin.git_bcommits, { noremap = true })
vim.keymap.set('n', '<C-f>', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
vim.keymap.set('n', '<leader>fs', builtin.git_status, { noremap = true })

vim.keymap.set({ 'n', 'v' }, '<leader>fc', function()
  builtin.grep_string();
end)

require('nvim-web-devicons').setup({
  override = {},
  default = true
})

require('telescope').setup {
  extensions = {
    live_grep_args = {
      auto_quoting = true,
      mappings = {
        i = {
          ["<C-k>"] = lga_actions.quote_prompt(),
          ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
        },
      },
    }
  },
  defaults = {
    path_display = { 'smart' },
    mappings = {
      i = {
        ["<C-h>"] = "which_key",
        ["<esc>"] = actions.close,
        ["<tab>"] = actions.toggle_selection + actions.move_selection_next,
        ["<s-tab>"] = actions.toggle_selection + actions.move_selection_previous,
        ["<cr>"] = custom_actions.fzf_multi_select
      },
      n = {
        ["<tab>"] = actions.toggle_selection + actions.move_selection_next,
        ["<s-tab>"] = actions.toggle_selection + actions.move_selection_previous,
        ["<cr>"] = custom_actions.fzf_multi_select
      }
    },
    layout_config = {
      horizontal = { preview_width = 0.60 }
    },
    dynamic_preview_title = true
  },
}

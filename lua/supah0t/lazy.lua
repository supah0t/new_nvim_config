-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

return require('lazy').setup({
  {
    'rebelot/kanagawa.nvim',
    as = 'kanagawa',
    config = function()
      vim.cmd('colorscheme kanagawa')
    end
  },
'nvim-treesitter/nvim-treesitter',
'preservim/nerdtree',
'Xuyuanp/nerdtree-git-plugin',
  {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons' }
  },
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {},
  },
  'MunifTanjim/prettier.nvim',
{
  "nvim-telescope/telescope.nvim",
  dependencies = {
    { 
        "nvim-telescope/telescope-live-grep-args.nvim" ,
        -- This will not install any breaking changes.
        -- For major updates, this must be adjusted manually.
        version = "^1.0.0",
    },
  },
  config = function()
    local telescope = require("telescope")

    -- first setup telescope
    telescope.setup({
        -- your config
    })

    -- then load the extension
    telescope.load_extension("live_grep_args")
  end
},
{
    'windwp/nvim-autopairs',
    config = function() require('nvim-autopairs').setup {} end
  },
'mg979/vim-visual-multi',
'tpope/vim-surround',
 'tpope/vim-repeat',
 { "nvim-tree/nvim-web-devicons", opts = {} },

  'hrsh7th/cmp-nvim-lsp',
  'esmuellert/nvim-eslint',
  'hrsh7th/cmp-buffer',
   'hrsh7th/cmp-path',
   'hrsh7th/cmp-cmdline',
   'hrsh7th/nvim-cmp',
   'onsails/lspkind-nvim',

   'saadparwaiz1/cmp_luasnip',
   'L3MON4D3/LuaSnip',
   'windwp/nvim-ts-autotag',
   'vimwiki/vimwiki',
   'preservim/nerdcommenter',
   'numToStr/FTerm.nvim',
   'airblade/vim-gitgutter',
   'mbbill/undotree',

  -- lazygit
'kdheepak/lazygit.nvim',

  -- git blamer
'APZelos/blamer.nvim',

  -- fugitive
'tpope/vim-fugitive',
  -- gv, requires fugitive
  'junegunn/gv.vim',

  -- trouble
{ 'folke/trouble.nvim',
    config = function () require('trouble').setup() end
  },

  -- harppoon
   'ThePrimeagen/harpoon',

  -- DiffView
   'sindrets/diffview.nvim',

  -- Todo highlighter
{ 'folke/todo-comments.nvim',
    config = function () require('todo-comments').setup() end
  },

{
      "aaronhallaert/advanced-git-search.nvim",
      config = function()
          require("telescope").load_extension("advanced_git_search")
      end,
      requires = {
          -- Insert Dependencies here
      },
  },
   'tpope/vim-rhubarb',
   'gabrielpoca/replacer.nvim',
})

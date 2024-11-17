-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use({
    'rebelot/kanagawa.nvim',
    as = 'kanagawa',
    config = function()
      vim.cmd('colorscheme kanagawa')
    end
  })
  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
  use 'preservim/nerdtree'
  use 'Xuyuanp/nerdtree-git-plugin'
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons' }
  }
  use {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
  }
  use {
    "pmizio/typescript-tools.nvim",
    requires = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    config = function()
      require("typescript-tools").setup {}
    end,
  }
  use('MunifTanjim/prettier.nvim')
  use {
    "nvim-telescope/telescope.nvim",
    requires = {
      { "nvim-telescope/telescope-live-grep-args.nvim" },
      { 'nvim-lua/plenary.nvim' }
    },
    config = function()
      require("telescope").load_extension("live_grep_args")
    end
  }
  use {
    'windwp/nvim-autopairs',
    config = function() require('nvim-autopairs').setup {} end
  }
  use 'mg979/vim-visual-multi'
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'

  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'onsails/lspkind-nvim'

  use 'saadparwaiz1/cmp_luasnip'
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'L3MON4D3/LuaSnip'
  use 'windwp/nvim-ts-autotag'
  use 'vimwiki/vimwiki'
  use 'preservim/nerdcommenter'
  use 'numToStr/FTerm.nvim'
  use 'airblade/vim-gitgutter'
  use 'mbbill/undotree'

  -- lazygit
  use 'kdheepak/lazygit.nvim'

  -- git blamer
  use 'APZelos/blamer.nvim'

  -- fugitive
  use 'tpope/vim-fugitive'
  -- gv, requires fugitive
  use 'junegunn/gv.vim'

  -- trouble
  use { 'folke/trouble.nvim',
    config = function () require('trouble').setup() end
  }

  -- harppoon
  use 'ThePrimeagen/harpoon'

  -- DiffView
  use 'sindrets/diffview.nvim'

  -- Todo highlighter
  use { 'folke/todo-comments.nvim',
    config = function () require('todo-comments').setup() end
  }

  use({
      "aaronhallaert/advanced-git-search.nvim",
      config = function()
          require("telescope").load_extension("advanced_git_search")
      end,
      requires = {
          -- Insert Dependencies here
      },
  })
  use 'tpope/vim-rhubarb'
  use 'gabrielpoca/replacer.nvim'
end)

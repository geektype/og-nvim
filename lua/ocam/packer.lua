vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.1',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }
  use({ 'rose-pine/neovim', as = 'rose-pine' })

  use( 'nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

  use {
	  'nvim-tree/nvim-tree.lua',
	  requires = {
		  'nvim-tree/nvim-web-devicons',
	  },
	  config = function()
		  require("nvim-tree").setup {}
	  end
  }

  use {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v2.x',
      requires = {
          {'neovim/nvim-lspconfig'},
          {
          'williamboman/mason.nvim',
          run = function()
              pcall(vim.cmd, 'MasonUpdate')
          end,
      },
      {'williamboman/mason-lspconfig.nvim'},

      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'L3MON4D3/LuaSnip'},
  }
    }
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }
    use {
        'numToStr/Comment.nvim',
    }
    use {
        "ray-x/lsp_signature.nvim",
    }

    use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}
    use { "catppuccin/nvim", as = "catppuccin" }
end)


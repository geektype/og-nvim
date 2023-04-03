local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    print("installed")
    return true
  end
  print("no need")
  return false
end

local packer_bootstrap = ensure_packer()


-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

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
    if packer_bootstrap then
        require('packer').sync()
    end
end)


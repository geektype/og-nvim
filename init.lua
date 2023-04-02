require("ocam.packer")
require("ocam.remap")
require("ocam.set")

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable
vim.opt.termguicolors = true

local function open_nvim_tree()

  -- open the tree
  require("nvim-tree.api").tree.open()
end
vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

vim.cmd.colorscheme("rose-pine")

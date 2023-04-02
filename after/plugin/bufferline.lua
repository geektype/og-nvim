local bufferline = require 'bufferline'

bufferline.setup {
    options = {
        numbers = "ordinal",
        diagnostics = "nvim_lsp",
        offsets = {
            {
                filetype = "NvimTree"
            }
        },
        hover = {
            enabled = true,
            delay = 100,
            reveal = {'close'}
        },
        separator_style = "thick"
    }
}

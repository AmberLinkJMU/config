vim.pack.add({
    { src = "https://github.com/navarasu/onedark.nvim" },
})

-- custom setup
require('onedark').setup({
    style = 'warmer',
})
vim.cmd("colorscheme onedark")

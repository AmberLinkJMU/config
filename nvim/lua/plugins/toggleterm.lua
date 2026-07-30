vim.pack.add({
    { src = "https://github.com/akinsho/toggleterm.nvim.git" },
})

require("toggleterm").setup({
    size = 15,
    config = true,
    hide_numbers = true,
    start_in_insert = false,
    open_mapping = [[<c-\>]], -- Default: Ctrl + \
    shade_terminals = true,
    shading_factor = 2,
    direction = "horizontal", -- or 'horizontal' / 'vertical' / 'tab'
    float_opts = {
        border = "curved",
        winblend = 0,
    },
})

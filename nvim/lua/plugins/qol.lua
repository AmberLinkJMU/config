vim.pack.add({
    -- mini
    { src = "https://github.com/echasnovski/mini.pairs.git" },
    { src = "https://github.com/echasnovski/mini.icons.git" },
    { src = "https://github.com/echasnovski/mini.cursorword.git" },
    { src = "https://github.com/echasnovski/mini.ai.git" },
    { src = "https://github.com/echasnovski/mini.surround.git" },
    { src = "https://github.com/echasnovski/mini.indentscope.git" },

    { src = "https://github.com/nvim-lualine/lualine.nvim.git" }, -- lualine

    { src = "https://github.com/karb94/neoscroll.nvim" },      -- scrolling
    { src = "https://github.com/folke/todo-comments.nvim" },   -- todo-comments
})

-- mini
require("mini.pairs").setup({})
require("mini.icons").setup({})
require("mini.ai").setup({})
require("mini.surround").setup({})
require("mini.indentscope").setup({
    draw = {
        animation = require("mini.indentscope").gen_animation.none(),
        delay = 0,
    },

    symbol = "│",
})

-- cursorword
require("mini.cursorword").setup({ delay = 0 })

vim.api.nvim_set_hl(0, 'MiniCursorword', { underline = false, bg = '#3b4252' })
vim.api.nvim_set_hl(0, 'MiniCursorwordCurrent', { underline = false, bg = '#3b4252' })

vim.api.nvim_create_autocmd("ColorScheme", {
    callback = function()
        vim.api.nvim_set_hl(0, "MiniCursorword", { link = "Visual" })
        vim.api.nvim_set_hl(0, "MiniCursorwordCurrent", { link = "Visual" })
    end,
})

-- lualine
require("lualine").setup({
    options = { theme = "onedark" },
})

-- smooth scrolling
require("neoscroll").setup({})

-- todo comments
require("todo-comments").setup({})

vim.pack.add({
    { src = "https://github.com/nvim-tree/nvim-web-devicons" },
    { src = "https://github.com/nvim-tree/nvim-tree.lua" },
})

require("nvim-tree").setup({
    actions = {
        open_file = {
            quit_on_open = true,
        },
    },
})

local tree_api = require("nvim-tree.api")

-- keymaps
vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>', { silent = true })
vim.keymap.set("n", "<leader>]", tree_api.tree.change_root_to_node)

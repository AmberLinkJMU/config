vim.pack.add({
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/mason-org/mason.nvim" },

    { src = "https://github.com/mason-org/mason-lspconfig.nvim" },
})

-- dependencies
require("lspconfig")
require("mason").setup()

-- mason-lsp config
require("mason-lspconfig").setup({
    ensure_installed = {
        "pyright", -- python
        "lua_ls",  -- lua
        "clangd",  -- c, c++
    },
    automatic_enable = true,
})

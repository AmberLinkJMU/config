vim.pack.add({
    { src = "https://github.com/ThePrimeagen/harpoon.git", version = "harpoon2" },
    { src = "https://github.com/nvim-lua/plenary.nvim.git" },
})

-- setup harpoon
local harpoon = require("harpoon")
harpoon:setup()

-- colorscheme autocmd
vim.api.nvim_create_autocmd("ColorScheme", {
    callback = function()
        vim.api.nvim_set_hl(0, "HarpoonBorder", { link = "FloatBorder" })
        vim.api.nvim_set_hl(0, "HarpoonWindow", { link = "NormalFloat" })
        vim.api.nvim_set_hl(0, "HarpoonTitle", { link = "Title" })
        vim.api.nvim_set_hl(0, "HarpoonActive", { link = "CursorLine" })
        vim.api.nvim_set_hl(0, "HarpoonInactive", { link = "Normal" })

        vim.opt_local.winblend = 20
    end,
})

-- filetype-specific tweaks
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "harpoon",
--   callback = function()
--     vim.api.nvim_set_hl(0, "HarpoonWindow", { link = "Normal" })
--     vim.api.nvim_set_hl(0, "HarpoonBorder", { link = "Normal" })
--     vim.opt_local.cursorline = true
--   end,
-- })

-- keybinds
vim.keymap.set("n", "<leader>h", function()
    harpoon.ui:toggle_quick_menu(harpoon:list())
end)

vim.keymap.set("n", "<leader>[", function()
    harpoon:list():add()
end)

vim.keymap.set("n", "<leader>u", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<leader>i", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<leader>o", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<leader>p", function() harpoon:list():select(4) end)
vim.keymap.set("n", "<leader>7", function() harpoon:list():select(5) end)
vim.keymap.set("n", "<leader>8", function() harpoon:list():select(6) end)
vim.keymap.set("n", "<leader>9", function() harpoon:list():select(7) end)
vim.keymap.set("n", "<leader>0", function() harpoon:list():select(8) end)

-- tabline
local function harpoon_tabline()
    local list = harpoon:list()
    local length = list:length()
    if length == 0 then
        return ""
    end

    local current_path = vim.api.nvim_buf_get_name(0)
    local tabs = {}
    local labels = { "u", "i", "o", "p", "7", "8", "9", "0" }

    for i = 1, length do
        local item = list:get(i)
        local name = vim.fn.fnamemodify(item.value, ":t")
        local full = vim.fn.fnamemodify(item.value, ":p")
        local is_active = (current_path == full)

        if is_active then
            tabs[i] = string.format("%%#TabLineSel# %s: %s %%#TabLine#", labels[i], name)
        else
            tabs[i] = string.format(" %s: %s ", labels[i], name)
        end
    end

    return "%#TabLine#" .. table.concat(tabs, "%#TabLineFill#|") .. "%#TabLineFill#"
end

vim.o.showtabline = 0
_G.HarpoonTabline = harpoon_tabline
vim.o.tabline = "%!v:lua.HarpoonTabline()"

vim.api.nvim_create_autocmd("BufEnter", {
    callback = function()
        vim.cmd("redrawtabline")
    end,
})

-- toggle tabline
local tabline_active = false
local function toggle_tabline()
    if tabline_active then
        vim.o.showtabline = 0
    else
        vim.o.showtabline = 2
    end
    tabline_active = not tabline_active
end

vim.keymap.set("n", "<leader>H", toggle_tabline)

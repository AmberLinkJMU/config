-- unbinding
vim.api.nvim_set_keymap("n", " ", "<Nop>", { silent = true })
vim.api.nvim_set_keymap("n", "<BS>", "<Nop>", { silent = true })
-- vim.api.nvim_set_keymap("n", "Vj", "<Nop>", { silent = true })
-- vim.api.nvim_set_keymap("n", "Vk", "<Nop>", { silent = true })

-- resize window
vim.keymap.set("n", "<C-k>", ":resize -2<CR>", { silent = true, remap = true })
vim.keymap.set("n", "<C-j>", ":resize +2<CR>", { silent = true, remap = true })
vim.keymap.set("n", "<C-h>", ":vertical resize -2<CR>", { silent = true, remap = true })
vim.keymap.set("n", "<C-l>", ":vertical resize +2<CR>", { silent = true, remap = true })

-- simple jump
vim.keymap.set("n", "J", "<C-d>", { silent = true, remap = true })
vim.keymap.set("n", "K", "<C-u>", { silent = true, remap = true })

-- directory
vim.keymap.set("n", "<leader>cd", vim.cmd.Ex)

-- convenience shit
vim.keymap.set({ "n", "v" }, "u", vim.cmd.u)
vim.keymap.set({ "n", "v" }, "<C-q>", vim.cmd.q)
vim.keymap.set({ "n", "v" }, "<leader>w", vim.cmd.w)

-- moving lines
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==")
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==")
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")

-- comments
vim.keymap.set("n", "'", "gcc", { remap = true })
vim.keymap.set("v", "'", "gc", { remap = true })

-- copy
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- scrolling with arrows
vim.keymap.set({ "n", "v" }, "<left>", "zh")
vim.keymap.set({ "n", "v" }, "<down>", "<c-e>")
vim.keymap.set({ "n", "v" }, "<up>", "<c-y>")
vim.keymap.set({ "n", "v" }, "<right>", "zl")

vim.keymap.set("i", "<left>", "<esc> zh")
vim.keymap.set("i", "<down>", "<esc> <c-e>")
vim.keymap.set("i", "<up>", "<esc> <c-y>")
vim.keymap.set("i", "<right>", "<esc> zl")

vim.keymap.set("n", "<S-left>", "zH")
vim.keymap.set("n", "<S-right>", "zL")

-- window control
-- nnoremap <silent> <leader>w2 :2wincmd w <cr>
vim.keymap.set("n", "<leader>a", ":1wincmd w <cr>", { silent = true })
vim.keymap.set("n", "<leader>s", ":2wincmd w <cr>", { silent = true })
vim.keymap.set("n", "<leader>d", ":3wincmd w <cr>", { silent = true })
vim.keymap.set("n", "<leader>f", ":4wincmd w <cr>", { silent = true })
vim.keymap.set("n", "<leader>g", ":5wincmd w <cr>", { silent = true })
vim.keymap.set("n", "<leader>t", ":5wincmd j <cr>", { silent = true })

-- transparency
vim.keymap.set("n", "T", ":ToggleTransparency <cr>", { silent = true })

-- macros
vim.keymap.set("n", "<leader>q", "@a <cr>")

-- search and replace word under the cursor.
vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>//g<Left><Left>]])

-- terminal
-- TODO: move to config for lazy loading
vim.keymap.set("n", "<A-t>", ":ToggleTerm <cr>", { silent = true })

function _G.set_terminal_keymaps()
	local opts = { buffer = 0 }
	vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
	-- vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
end

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

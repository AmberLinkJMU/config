-- clear cache
vim.api.nvim_create_user_command("CC", function()
	vim.cmd("!rm -rf ~/.cache/nvim")
	vim.cmd("!rm -rf ~/.local/share/nvim")
	vim.cmd("!rm -rf ~/.local/state/nvim")
end, {})

-- launch cs
vim.keymap.set("n", "<F12>", ":!steam steam://rungameid/730<cr>")
vim.api.nvim_create_user_command("CS", function()
	vim.cmd("<cmd>steam steam://rungameid/730<cr>")
end, {})

-- transparency toggle
vim.api.nvim_create_user_command("ToggleTransparency", function()
	local ok, scheme = pcall(require, "onedark")
	if ok then
		vim.g.transparent = not vim.g.transparent
		scheme.setup({ transparent = vim.g.transparent })
		scheme.load()
	else
		vim.notify("Failed to load onedark", vim.log.levels.WARN)
	end
end, {})

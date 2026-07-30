-- leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- terminal
vim.opt.hidden = true
vim.opt.shell = "fish"
vim.opt.termguicolors = true

-- core config
require("core.options")
require("core.keybinds")
require("core.commands")

-- plugins
require("plugins.colorscheme")
require("plugins.toggleterm")
require("plugins.nvim-tree")
require("plugins.harpoon")
require("plugins.qol")
require("plugins.lsp-config")
require("plugins.conform")
require("plugins.blink")
require("plugins.telescope")

-- the funny
local funny_list = {
	"sudo make me a sandwich",
	"this time i'm really gonna do it",
	"you had it set to M for Mini, when it should be set to W for Wumbo",
	"hello everypony ^-^",
	"help me terry davis",
	"holographic meat loaf... my favorite !",
	"WAIT DON'T TELL ME",
	"we serve food here",
	"you used me... for land development !",
	"did you check under the tray ?",
	"oh boy, 3am !",
	"goodbye everyone, i'll remember you all in therapy",
	"you don't need a lisence to drive a sandwich",
	"i put the hot in psychotic",
	"thats it your going in the soup",
	"minimalizm is a scam invented by big small to sell more less",
	"your trauma is niche",
	"uh oh, it broke.  whole computer broke", -- sprague
    "why do it by hand in 10 minutes when you can automate it in 10 hours",
    "the great thing about standards is that there's so many to choose from",
    "writing code takes 90% of the project time; testing takes the other 90%",
    "PEBKAC: problem exists between keyboard and chair",
}

math.randomseed(os.time())
print(funny_list[math.random(#funny_list)])

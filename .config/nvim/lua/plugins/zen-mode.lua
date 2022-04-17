require("zen-mode").setup({
	window = {
		height = 0.95, -- height
		width = 80, -- width of the Zen window
		backdrop = 0.65, -- shade backdrop
	},
	plugins = {
		kitty = {
			enabled = true,
			font = "+4", -- font size increment
		},
	},
})

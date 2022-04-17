local file_ignore_patterns = {
	".git/",
	"node_modules",
}

local layout_config = {
	height = 0.95,
	preview_width = 0.6,
	width = 0.8,
}

require("telescope").setup({
	defaults = {
		file_ignore_patterns = file_ignore_patterns,
		layout_config = layout_config,
		layout_strategy = "horizontal",
	},
	pickers = {
		find_files = {
			hidden = true,
		},
		grep_string = {

			hidden = true,
		},
		live_grep = {
			hidden = true,
		},
	},
	extensions = {
		file_browser = {
			grouped = true,
			hidden = true,
			layout_config = layout_config,
			layout_strategy = "horizontal",
		},
	},
})

-- To get telescope-file-browser loaded and working with telescope,
-- you need to call load_extension, somewhere after setup function:
require("telescope").load_extension("file_browser")

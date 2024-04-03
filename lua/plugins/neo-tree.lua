return {
	"nvim-neo-tree/neo-tree.nvim",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		enable_cursor_hijack = true,
		filesystem = {
			filtered_items = {
				visible = true,
				hide_dotfiles = false,
				hide_gitignored = false,
			},
			follow_current_file = {
				enabled = true,
				leave_dirs_open = true,
			},
			mappings = {
				["C-["] = "set_root",
				["C-]"] = "navigate_up",
			},
			components = {
			},
		},
		window = {
			width = 30,
		},
		default_component_configs = {
			indent = {
				with_markers = true,
				indent_marker = "│",
				last_indent_marker = "└",
				indent_size = 2,
				with_expanders = true,
				expander_collapsed = "",
				expander_expanded = "",
				expander_highlight = "NeoTreeExpander",
			},
		},
	},
	config = function(_, opts)
		require("neo-tree").setup(opts)
	end,
}

return {
	"folke/which-key.nvim",
	event = "VimEnter",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	opts = {
		plugins = { spelling = true },
		defaults = {
			mode = { "n", "v" },
			["<leader>f"] = { name = "+find" },
			["<leader>t"] = { name = "+trouble" },
			["<leader>n"] = { name = "+noice/notify" },
			["<leader>q"] = { name = "+quit/sessions" },
			["<leader>g"] = { name = "+git" },
		},
	},
	config = function(_, opts)
		local wk = require("which-key")
		wk.setup(opts)
		wk.register(opts.defaults)
	end,
}

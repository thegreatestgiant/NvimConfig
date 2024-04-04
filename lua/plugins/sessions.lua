return {
	"folke/persistence.nvim",
	event = "BufReadPre",
	opts = { options = vim.opt.sessionoptions:get() },
	config = function(_, opts)
		require("persistence").startup(opts)
		require("utils").load_mappings("sessions")
	end,
}

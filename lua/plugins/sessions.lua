return {
	"folke/persistence.nvim",
	event = "BufReadPre",
	opts = { options = vim.opt.sessionoptions:get() },
	config = function()
		require("utils").load_mappings("sessions")
	end,
}

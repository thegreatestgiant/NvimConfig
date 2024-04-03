return {
	"folke/trouble.nvim",
	branch = "dev",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	cmd = { "Trouble", "TroubleToggle" },
	opts = {
		use_diagnostic_signs = true,
	},
	config = function(_, opts)
		require("trouble").setup(opts)
		require("utils").load_mappings("trouble")
	end,
}

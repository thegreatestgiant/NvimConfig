return {
	"stevearc/conform.nvim",
	event = "BufWritePre",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "isort", "black" },
		},
		format_on_save = {
			timeout_ms = 500,
			lsp_fallout = true,
		},
	},
	config = function(_, opts)
		require("conform").setup(opts)
	end,
}

return {
	"akinsho/bufferline.nvim",
	config = function(_, opts)
		require("bufferline").setup({
			options = {
				themable = true,
				offsets = {
					{
						filetype = "neo-tree",
						text = "󰉓  FileExplorer",
						highlight = "Directory",
						text_align = "left",
						seperator = true,
					},
				},
				hover = {
					enabled = true,
					delay = 200,
					reveal = { "close" },
				},
				indicator = "underline",
				seperator_style = "padded_slant",
			},
		})
		require("utils").load_mappings("bufferline")
		-- Fix bufferline when restoring a session
		--   vim.api.nvim_create_autocmd("BufAdd", {
		--     callback = function()
		--       vim.schedule(function()
		--         pcall(nvim_bufferline)
		--       end)
		--     end,
		--   })
	end,
}

return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	init = function()
		vim.g.lualine_laststatus = vim.o.laststatus
		if vim.fn.argc(-1) > 0 then
			-- set an empty statusline till lualine loads
			vim.o.statusline = " "
		else
			-- hide the statusline on the starter page
			vim.o.laststatus = 0
		end
	end,
	opts = function()
		-- PERF: we don't need this lualine require madness 🤷
		local trouble = require("trouble")
		local lualine_require = require("lualine_require")
		lualine_require.require = require

		local symbols = trouble.statusline({
			mode = "symbols",
			groups = {},
			title = false,
			filter = { range = true },
			format = "{kind_icon}{symbol.name:Normal}",
		})

		vim.o.laststatus = vim.g.lualine_laststatus

		return {
			options = {
				theme = "catppuccin",
				globalstatus = true,
				disabled_filetypes = { statusline = { "dashboard", "alpha", "starter" } },
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch" },

				lualine_c = {
					{ "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
					{
						symbols.get,
						cond = symbols.has,
					},
				},
				lualine_x = {
          -- stylua: ignore
          -- {
          -- function() return require("noice").api.status.command.get() end,
          -- cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
          -- },
          -- stylua: ignore
          -- {
          -- function() return require("noice").api.status.mode.get() end,
          -- cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
          -- },
          -- stylua: ignore
          --            {
          -- function() return "  " .. require("dap").status() end,
          -- cond = function () return package.loaded["dap"] and require("dap").status() ~= "" end,
          -- color = LazyVim.ui.fg("Debug"),
          --          },
          {
            require("lazy.status").updates,
            cond = require("lazy.status").has_updates,
          },
					{
						source = function()
							local gitsigns = vim.b.gitsigns_status_dict
							if gitsigns then
								return {
									added = gitsigns.added,
									modified = gitsigns.changed,
									removed = gitsigns.removed,
								}
							end
						end,
					},
				},
				lualine_y = {
					{ "progress", separator = " ", padding = { left = 1, right = 0 } },
					{ "location", padding = { left = 0, right = 1 } },
				},
				lualine_z = {
					function()
						return " " .. os.date("%-I:%02M %p")
					end,
				},
			},
			extensions = { "nvim-tree", "lazy" },
		}
	end,
}

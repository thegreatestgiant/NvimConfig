local M = {}

M.general = {
	n = {
		["<C-n>"] = { "<cmd> Neotree toggle <CR>", "Toggle Neo-Tree" },

		-- switch between windows
		["<C-h>"] = { "<C-w>h", "Window left" },
		["<C-l>"] = { "<C-w>l", "Window right" },
		["<C-j>"] = { "<C-w>j", "Window down" },
		["<C-k>"] = { "<C-w>k", "Window up" },

		-- save
		["<C-s>"] = { "<cmd> w <CR>", "Save file" },

		-- Copy all
		["<C-c>"] = { "<cmd> %y+ <CR>", "Copy whole file" },
	},
	i = {
		-- go to  beginning and end
		["<C-b>"] = { "<ESC>^i", "Beginning of line" },
		["<C-e>"] = { "<End>", "End of line" },
	},
	t = {
		["<C-x>"] = { vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true), "Escape terminal mode" },
	},
}

M.bufferline = {
	n = {
		["<tab>"] = { "<cmd> BufferLineCycleNext <cr>", "Next Buffer" },
		["<S-tab>"] = { "<cmd> BufferLineCyclePrev <cr>", "Prev Buffer" },
	},
}

M.bufremove = {
	n = {
		["<leader>x"] = {
			function()
				local bd = require("mini.bufremove").delete
				if vim.bo.modified then
					local choice =
						vim.fn.confirm(("Save changes to %q?"):format(vim.fn.bufname()), "&Yes\n&No\n&Cancel")
					if choice == 1 then -- Yes
						vim.cmd.write()
						bd(0)
					elseif choice == 2 then -- No
						bd(0, true)
					end
				else
					bd(0)
				end
			end,
			"Delete Buffer",
		},
	},
}

M.telescope = {
	n = {
		["<leader>ff"] = { "<cmd> Telescope find_files <CR>", "[F]ind [F]iles in cwd" },
		["<leader>fw"] = { "<cmd> Telescope live_grep <CR>", "[F]ind [W]ord in cwd" },
		["<leader>fo"] = { "<cmd> Telescope oldfiles <CR>", "[F]ind [O]ld files (recently opened)" },
		["<leader>fv"] = { "<cmd> Telescope vim_options <CR>", "[F]ind [V]im Options" },
		["<leader>fs"] = { "<cmd> Telescope current_buffer_fuzzy_find <CR>", "[F]uzzy [S]earch in this buffer" },
		["<leader>fc"] = {
			function()
				require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("config") })
			end,
			"[F]ind [C]fg files",
		},
		["<leader>:"] = { "<cmd> Telescope command_history <CR>", "Command History" },
	},
}

M.lsp = {
	n = {
		["K"] = { vim.lsp.buf.hover, "LSP Hover Info" },
	},
}

M.null_ls = {
	n = {
		["<leader>fm"] = { vim.lsp.buf.format, "[F]or[m]at file" },
	},
}

return M
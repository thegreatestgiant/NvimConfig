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

M.trouble = {
	n = {
		["<leader>td"] = { "<cmd>Trouble document_diagnostics<cr>", "Document Diagnostics (Trouble)" },
		["<leader>tw"] = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics (Trouble)" },
		["<leader>tl"] = { "<cmd>Trouble loclist<cr>", "Location List (Trouble)" },
		["<leader>tc"] = {
			function()
				require("trouble").close()
			end,
			"Close any Trouble Window",
		},
		["<leader>tq"] = { "<cmd>Trouble quickfix<cr>", "Quickfix List (Trouble)" },
		["[q"] = {
			function()
				if require("trouble").is_open() then
					require("trouble").previous({ skip_groups = true, jump = true })
				else
					local ok, err = pcall(vim.cmd.cprev)
					if not ok then
						vim.notify(err, vim.log.levels.ERROR)
					end
				end
			end,
			"Previous Trouble/Quickfix Item",
		},
		["]q"] = {
			function()
				if require("trouble").is_open() then
					require("trouble").next({ skip_groups = true, jump = true })
				else
					local ok, err = pcall(vim.cmd.cnext)
					if not ok then
						vim.notify(err, vim.log.levels.ERROR)
					end
				end
			end,
			"Next Trouble/Quickfix Item",
		},
	},
}

M.todo = {
	n = {
		["<leader>tt"] = { "<cmd> TodoTrouble <CR>", "Todo via Trouble" },
		["<leader>ft"] = { "<cmd> TodoTelescope <CR>", "Todo via Telescope" },
    -- stylua: ignore
    ["]t"] = { function() require("todo-comments").jump_next() end, "Next Todo Comment" },
    -- stylua: ignore
		["[t"] = { function() require("todo-comments").jump_prev() end, "Previous Todo Comment" },
	},
}

M.notify = {
	n = {
    -- stylua: ignore
		["<leader>nd"] = { function() require("notify").dismiss({ pending = false }) end, "[N]otify [D]ismiss" },
		["<leader>nh"] = { "<cmd> Telescope notify", "[N]otify [H]istory" },
	},
}

M.noice = {
	n = {
		["<leader>nl"] = { "<cmd> Noice last <CR>", "Noice Last Message" },
		["<leader>nh"] = { "<cmd> Noice telescope <CR>", "Noice History" },
		["<leader>nd"] = { "<cmd> Noice dismiss <CR>", "Dismiss All" },
    -- stylua: ignore
    ["<c-f>"] = { function() if not require("noice.lsp").scroll(4) then return "<c-f>" end end, "Scroll Forward" },
    -- stylua: ignore
    ["<c-b>"] = { function() if not require("noice.lsp").scroll(-4) then return "<c-b>" end end, "Scroll Backward" }
,
	},
  -- stylua: ignore
  i = {
    ["<c-f>"] = { function() if not require("noice.lsp").scroll(4) then return "<c-f>" end end, "Scroll Forward" },
    ["<c-b>"] = { function() if not require("noice.lsp").scroll(-4) then return "<c-b>" end end, "Scroll Backward" }
  },
  -- stylua: ignore
  s = {
    ["<c-f>"] = { function() if not require("noice.lsp").scroll(4) then return "<c-f>" end end, "Scroll Forward" },
    ["<c-b>"] = { function() if not require("noice.lsp").scroll(-4) then return "<c-b>" end end, "Scroll Backward" }
  },
}

M.sessions = {
  -- stylua: ignore
	n = {
      { "<leader>qs", function() require("persistence").load() end, "Restore Session" },
      { "<leader>ql", function() require("persistence").load({ last = true }) end, "Restore Last Session" },
      { "<leader>qd", function() require("persistence").stop() end, "Don't Save Current Session" },
  },
}

return M

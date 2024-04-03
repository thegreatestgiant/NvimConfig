return {
	{
		"williamboman/mason.nvim",
		cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
		opts = {
			ensure_installed = {
				"black",
				"lua_ls",
				"isort",
				"stylua",
			},
			ui = {
				icons = {
					package_pending = " ",
					package_installed = "󰄳 ",
					package_uninstalled = " 󰚌",
				},
			},

			max_concurrent_installers = 10,
		},
		config = function(_, opts)
			require("mason").setup(opts)
			vim.api.nvim_create_user_command("MasonInstallAll", function()
				if opts.ensure_installed and #opts.ensure_installed > 0 then
					vim.cmd("MasonInstall " .. table.concat(opts.ensure_installed, " "))
				end
			end, {})

			vim.g.mason_binaries_list = opts.ensure_installed
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = { auto_install = true },
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			require("utils").load_mappings("lsp")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local on_attach = function(client, bufnr)
				if client.server_capabilities.documentSymbolProvider then
					navic.attach(client, bufnr)
				end
			end

			local lspcfg = require("lspconfig")

			local servers = { "lua_ls" }

			for _, lsp in ipairs(servers) do
				lspcfg[lsp].setup({
					capabilities = capabilities,
					on_attach = on_attach,
				})
			end
		end,
	},
}

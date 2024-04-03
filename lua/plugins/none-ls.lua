return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.completion.spell,
        null_ls.builtins.code_actions.gitsigns,
        null_ls.builtins.code_actions.gomodifytags,
        null_ls.builtins.code_actions.impl,
        null_ls.builtins.completion.luasnip,
        null_ls.builtins.diagnostics.actionlint,
        null_ls.builtins.diagnostics.alex,
        null_ls.builtins.diagnostics.ansiblelint,
        null_ls.builtins.diagnostics.commitlint,
        null_ls.builtins.diagnostics.markdownlint,
        null_ls.builtins.diagnostics.mypy,
        null_ls.builtins.diagnostics.staticcheck,
        null_ls.builtins.diagnostics.yamllint,
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.gofmt,
        null_ls.builtins.formatting.gofumpt,
        null_ls.builtins.formatting.goimports,
        null_ls.builtins.formatting.goimports_reviser,
        null_ls.builtins.formatting.golines,
        null_ls.builtins.formatting.isort,
        null_ls.builtins.formatting.markdownlint,
        null_ls.builtins.formatting.prettier,
      },
    })
    require("utils").load_mappings("null_ls")
  end,
}

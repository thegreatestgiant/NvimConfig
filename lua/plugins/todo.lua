return {
	"folke/todo-comments.nvim",
	event = "VimEnter",
	config = function()
		require("todo-comments").setup()
		require("utils").load_mappings("todo")
	end,
}

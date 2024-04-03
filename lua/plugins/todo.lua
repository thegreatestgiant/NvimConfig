return {
	"folke/todo-comments.nvim",
	event = "VimEnter",
	opts = {},
	config = function()
		require("utils").load_mappings("todo")
	end,
}

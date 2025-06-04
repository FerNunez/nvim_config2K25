return {
	"nvim-treesitter/nvim-treesitter-context",

	config = function()
		require("treesitter-context").setup({
			enable = true, -- this MUST be true
			max_lines = 5, -- how many lines the context window can span
			mode = "cursor", -- or "topline"
		})
	end,
}

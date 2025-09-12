return {
	"lewis6991/gitsigns.nvim",
	keys = {
		-- Navigation
		{ "]h", "<cmd>Gitsigns next_hunk<cr>", desc = "Next git hunk" },
		{ "[h", "<cmd>Gitsigns prev_hunk<cr>", desc = "Previous git hunk" },

		-- Hunk operations
		{ "<leader>gs", "<cmd>Gitsigns stage_hunk<cr>", desc = "Stage hunk" },
		{ "<leader>gr", "<cmd>Gitsigns reset_hunk<cr>", desc = "Reset hunk" },
		{ "<leader>gu", "<cmd>Gitsigns undo_stage_hunk<cr>", desc = "Undo stage hunk" },
		{ "<leader>gp", "<cmd>Gitsigns preview_hunk<cr>", desc = "Preview hunk" },

		-- Buffer operations
		{ "<leader>gS", "<cmd>Gitsigns stage_buffer<cr>", desc = "Stage buffer" },
		{ "<leader>gR", "<cmd>Gitsigns reset_buffer<cr>", desc = "Reset buffer" },

		-- Blame & info
		{ "<leader>gb", "<cmd>Gitsigns toggle_current_line_blame<cr>", desc = "Toggle git blame" },
		{ "<leader>gB", "<cmd>Gitsigns blame_line<cr>", desc = "Blame line" },
		{ "<leader>gd", "<cmd>Gitsigns toggle_deleted<cr>", desc = "Toggle deleted lines" },

		-- Visual mode operations
		{ "<leader>gs", "<cmd>Gitsigns stage_hunk<cr>", mode = "v", desc = "Stage hunk" },
		{ "<leader>gr", "<cmd>Gitsigns reset_hunk<cr>", mode = "v", desc = "Reset hunk" },
	},
	config = function()
		require("gitsigns").setup({
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
			on_attach = function(bufnr)
				local gitsigns = require("gitsigns")

				-- Text objects
				vim.keymap.set(
					{ "o", "x" },
					"ih",
					":<C-U>Gitsigns select_hunk<CR>",
					{ buffer = bufnr, desc = "Inner hunk" }
				)
				vim.keymap.set(
					{ "o", "x" },
					"ah",
					":<C-U>Gitsigns select_hunk<CR>",
					{ buffer = bufnr, desc = "Around hunk" }
				)
			end,
		})
	end,
}

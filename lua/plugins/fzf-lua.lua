return {
	"ibhagwan/fzf-lua",
	-- optional for icon support
	-- dependencies = { "nvim-tree/nvim-web-devicons" },
	-- or if using mini.icons/mini.nvim
	dependencies = { "echasnovski/mini.icons" },
	config = function()
		require("fzf-lua").setup({
			grep = {
				rg_glob = true,
			},
		})
	end,
	keys = {
		{
			"<leader>ff",
			function()
				require("fzf-lua").files()
			end,
			desc = "Find Files in project directory",
		},
		{
			"<leader>fF",
			function()
				local git_root = vim.fn.system("git rev-parse --show-toplevel 2>/dev/null"):gsub("\n", "")
				if vim.v.shell_error == 0 then
					require("fzf-lua").files({ cwd = git_root })
				else
					-- Fallback to current working directory if not in a git repo
					require("fzf-lua").files({ cwd = vim.fn.getcwd() })
				end
			end,
			desc = "Find Files from Git Root",
		},
		{
			"<leader>fg",
			function()
				require("fzf-lua").live_grep()
			end,
			desc = "Find by grepping in project directory",
		},
		{
			"<leader>fn",
			function()
				require("fzf-lua").files({ cwd = vim.fn.stdpath("config") })
			end,
			desc = "Find in neovim configuration",
		},
		{
			"<leader>fe",
			function()
				require("fzf-lua").live_grep_glob()
			end,
			desc = "Find by grepping with -- *.lua !*spec*",
		},
		{
			"<leader>fE",
			function()
				local git_root = vim.fn.system("git rev-parse --show-toplevel 2>/dev/null"):gsub("\n", "")
				if vim.v.shell_error == 0 then
					require("fzf-lua").live_grep_glob({ cwd = git_root })
				else
					require("fzf-lua").live_grep_glob({ cwd = vim.fn.getcwd() })
				end
			end,
			desc = "Find by grepping from Git Root",
		},
		{
			"<leader>fh",
			function()
				require("fzf-lua").helptags()
			end,
			desc = "[F]ind [H]elp",
		},
		{
			"<leader>fk",
			function()
				require("fzf-lua").keymaps()
			end,
			desc = "[F]ind [K]eymaps",
		},
		{
			"<leader>fb",
			function()
				require("fzf-lua").builtin()
			end,
			desc = "[F]ind [B]uiltin FZF",
		},
		{
			"<leader>fw",
			function()
				require("fzf-lua").grep_cword()
			end,
			desc = "[F]ind current [W]ord",
		},
		{
			"<leader>fW",
			function()
				require("fzf-lua").grep_cWORD()
			end,
			desc = "[F]ind current [W]ORD",
		},
		{
			"<leader>fd",
			function()
				require("fzf-lua").diagnostics_document()
			end,
			desc = "[F]ind [D]iagnostics",
		},
		{
			"<leader>fr",
			function()
				require("fzf-lua").resume()
			end,
			desc = "[F]ind [R]esume",
		},
		{
			"<leader>fo",
			function()
				require("fzf-lua").oldfiles()
			end,
			desc = "[F]ind [O]ld Files",
		},
		{
			"<leader><leader>",
			function()
				require("fzf-lua").buffers()
			end,
			desc = "[,] Find existing buffers",
		},
		{
			"<leader>/",
			function()
				require("fzf-lua").lgrep_curbuf()
			end,
			desc = "[/] Live grep the current buffer",
		},
		{
			"<leader>ft",
			function()
				require("fzf-lua").treesitter()
			end,
			desc = "Find Treesitter symbols",
		},
		{
			"<leader>fl",
			function()
				require("fzf-lua").grep_project()
			end,
			desc = "Find all projects line",
		},
		{
			"<leader>fB",
			function()
				require("fzf-lua").git_branches()
			end,
			desc = "Find Branches in Git",
		},
		{
			"<leader>fc",
			function()
				require("fzf-lua").git_commits()
			end,
			desc = "Find coMmits in Git",
		},
		{
			"<leader>fD",
			function()
				require("fzf-lua").git_diff()
			end,
			desc = "Find diff Git",
		},
		{
			"<leader>fj",
			function()
				require("fzf-lua").jumps()
			end,
			desc = "Find Jumps",
		},
		{
			"<leader>fC",
			function()
				require("fzf-lua").changes()
			end,
			desc = "Find changes",
		},
		{
			"<leader>fS",
			function()
				require("fzf-lua").changes()
			end,
			desc = "Find tmux paste buffers",
		},
	},
}

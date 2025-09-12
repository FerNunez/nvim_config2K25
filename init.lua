require("config.lazy")

function EditLineFromLazygit(file_path, line)
	local path = vim.fn.expand("%:p")
	if path == file_path then
		vim.cmd(tostring(line))
	else
		vim.cmd("e " .. vim.fn.fnameescape(file_path))
		vim.cmd(tostring(line))
	end
end

function EditFromLazygit(file_path)
	local path = vim.fn.expand("%:p")
	if path == file_path then
		return
	else
		vim.cmd("e " .. vim.fn.fnameescape(file_path))
	end
end

-- Custom command: Substitue first Word
-- :'<,'>s/\(\S\+\)\s\+.*/\1/
vim.api.nvim_create_user_command("SubFirstWord", function()
	vim.cmd("'<,'>s/\\(\\S\\+\\)\\s\\+.*/\\1/")
end, { range = true })
-- Key mapping
vim.keymap.set("v", "<leader>sf", ":<C-u>'<,'>s/\\(\\S\\+\\)\\s\\+.*/\\1/<CR>", { desc = "Keep only first word" })

-- Mapping to copyt relative path
vim.keymap.set("n", "<leader>cp", function()
	vim.fn.setreg("+", vim.fn.expand("%"))
end, { desc = "Copy relative file path" })
vim.keymap.set("n", "<leader>cP", function()
	vim.fn.setreg("+", vim.fn.expand("%"))
end, { desc = "Copy absolute file path" })

vim.keymap.set("n", "<leader>cf", function()
	local ts_utils = require("nvim-treesitter.ts_utils")
	local node = ts_utils.get_node_at_cursor()
	local function_nodes = { "function_declaration", "method_declaration" }

	while node do
		if vim.tbl_contains(function_nodes, node:type()) then
			local name_node = node:field("name")[1]
			if name_node then
				local fn_name = vim.treesitter.get_node_text(name_node, 0)
				vim.fn.setreg("+", fn_name)
				print("Copied function name: " .. fn_name)
				return
			end
		end
		node = node:parent()
	end
	print("No function found at cursor")
end, { desc = "Copy Go function name under cursor" })

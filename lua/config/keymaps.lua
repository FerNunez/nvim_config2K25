-- yanking all papers
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- oil
vim.keymap.set("n", "-", "<cmd>Oil --float<CR>", { desc = "Open Parent Directory in Oil" })

-- Lazy git
vim.keymap.set("n", "gl", function()
	vim.diagnostic.open_float()
end, { desc = "Open Diagnosit in Float" })

-- confom fortmat
vim.keymap.set("n", "<leader>fm", function()
	require("conform").format()
end, { desc = "ForMat current file" })

-- Harpoon
vim.keymap.set("n", "<leader>hh", function()
	require("harpoon.ui").toggle_quick_menu()
end, { desc = "Harpoon UI" })
vim.keymap.set("n", "<leader>hm", function()
	require("harpoon.mark").add_file()
end, { desc = "Harpoon add" })
vim.keymap.set("n", "<leader>h1", function()
	require("harpoon.ui").nav_file(1) -- navigates to file 1
end, { desc = "Harpoon [1]" })
vim.keymap.set("n", "<leader>h2", function()
	require("harpoon.ui").nav_file(2) -- navigates to file 2
end, { desc = "Harpoon [2]" })
vim.keymap.set("n", "<leader>h3", function()
	require("harpoon.ui").nav_file(3) -- navigates to file 3
end, { desc = "Harpoon [3]" })

return {
	"github/copilot.vim",
	config = function()
		vim.g.copilot_no_tab_map = true
		vim.keymap.set("i", "<C-b>", "<Plug>(copilot-suggest)")
		vim.keymap.set("i", "<C-n>", "<Plug>(copilot-next)")
		vim.keymap.set("i", "<C-c>", "<Plug>(copilot-accept-word)")
		vim.keymap.set("i", "<C-x>", "<Plug>(copilot-accept-line)")
		--vim.keymap.set('i', '<C-!>', '<Plug>(copilot-accept-word)')
		--
		local user_pass = vim.env.USER_PASSWORD
		local proxy = vim.env.PROXY_COSMO
		vim.g.copilot_proxy = "http://" .. user_pass .. "@" .. proxy
	end,
}

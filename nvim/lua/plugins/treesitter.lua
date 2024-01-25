local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
		print("treesitter plugin not found!")
		return
end

treesitter.setup({
		ensure_installed = { "lua", "javascript", "html" },
		sync_install = false,
		highlight = { enable = true },
		indent = { enable = true },
})

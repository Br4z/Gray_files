local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- Latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{
		"romainl/Apprentice"
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" }
	},
	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		dependencies = { {"nvim-tree/nvim-web-devicons"} }
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate"
	}
})

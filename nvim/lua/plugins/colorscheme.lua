return {
	{
		"romainl/Apprentice",
		config = function()
			vim.cmd.colorscheme "apprentice"

			local function has_truecolor()
				if vim.fn.has("termguicolors") == 1 then
					return true
				end
				return false
			end

			if has_truecolor() then
				vim.opt.termguicolors = true
			end
		end
	}
}

local colorscheme_status, colorscheme = pcall(vim.cmd, "colorscheme apprentice")
if not colorscheme_status then
	print("colorscheme not found!")
	return
end


local function has_truecolor()
	if vim.fn.has("termguicolors") == 1 then
		return true
	end
	return false
end


if has_truecolor() then
	vim.opt.termguicolors = true
end

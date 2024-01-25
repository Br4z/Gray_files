local options = {
	mouse = "a", -- Allow the mouse to be used in neovim

	cursorline = true, -- Highlight the screen line of the cursor
	cursorcolumn = true, -- Highlight the screen column of the cursor
	number = true, -- Print the line number in front of each line
	relativenumber = true, -- Show relative line number in front of each line

	-- list = true, -- Show some invisible characters (tabs...)
	expandtab = false, -- Use spaces when <Tab> is inserted
	tabstop = 4, -- Number of spaces that a <Tab> in the file counts for
	softtabstop = 4, -- Number of spaces that a <Tab> counts for while performing editing operations
	shiftwidth = 0, -- Number of spaces to use for (auto)indent step
	smarttab = false, -- Use "shiftwidth" when inserting <Tab>

	clipboard = "unnamedplus", -- Allows neovim to access the system clipboard

	modified = true, -- Allow to modify the "fileformat" option
	fileencoding = "utf-8", -- File-content encoding for the current buffer.
	fileformat = "unix",

	-- hlsearch = true, -- Highlight matches with last search pattern
	-- ignorecase = true, -- Ignore case in search patterns
	-- smartcase = true, -- Smart case

	-- splitbelow = true, -- Force all horizontal splits to go below current window
	-- splitright = true, -- Force all vertical splits to go to the right of current window

	-- wrap = true, -- Do not show the lines as long as they are
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.opt.listchars = {
		eol = "↵",
		trail = "•",
		extends = "⟩",
		precedes = "⟨",
}

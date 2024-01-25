local status, dashboard = pcall(require, "dashboard")
if not status then
	print("dashboard plugin not found!")
	return
end

dashboard.setup{
	config = {
		header = {
			"",
			" ███▄    █ ▓█████  ▒█████   ██▒   █▓ ██▓ ███▄ ▄███▓",
			" ██ ▀█   █ ▓█   ▀ ▒██▒  ██▒▓██░   █▒▓██▒▓██▒▀█▀ ██▒",
			"▓██  ▀█ ██▒▒███   ▒██░  ██▒ ▓██  █▒░▒██▒▓██    ▓██░",
			"▓██▒  ▐▌██▒▒▓█  ▄ ▒██   ██░  ▒██ █░░░██░▒██    ▒██ ",
			"▒██░   ▓██░░▒████▒░ ████▓▒░   ▒▀█░  ░██░▒██▒   ░██▒",
			"░ ▒░   ▒ ▒ ░░ ▒░ ░░ ▒░▒░▒░    ░ ▐░  ░▓  ░ ▒░   ░  ░",
			"░ ░░   ░ ▒░ ░ ░  ░  ░ ▒ ▒░    ░ ░░   ▒ ░░  ░      ░",
			"   ░   ░ ░    ░   ░ ░ ░ ▒       ░░   ▒ ░░      ░   ",
			"         ░    ░  ░    ░ ░        ░   ░         ░   ",
			"                                ░                  ",
			"",
		},
		shortcut = {
			{
				icon = " ",
				icon_hl = "@variable",
				desc = "file browser",
				group = "Label",
				action = "Telescope find_files",
				key = "f",
			},
			{
				icon = " ",
				desc = "find file",
				group = "label",
				action = "Telescope find_files find_command=rg,--hidden,--files",
				key = "a",
			},
			{
				icon = " ",
				desc = "dotfiles",
				group = "Number",
				action = "cd $HOME/.config/nvim | Telescope find_files",
				key = "d",
			}
		},
		footer = {
			"NOW THE MOON I\"S RISING",
		}
	}
}

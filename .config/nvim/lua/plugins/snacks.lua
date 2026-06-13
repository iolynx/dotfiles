return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		animate = { enabled = true },
		notifier = { enabled = false },
		terminal = { enabled = true },
		picker = { enabled = true },
		dashboard = {
			width = 60,
			col = nil,
			row = nil,
			pane_gap = 4,
			autokeys = "1234567890abcdefghijklmnopqrstuvwxyz",
			preset = {
				pick = 1,
				header = [[
                                          
                         ███                 
                        ▒▒▒                  
 ████████   █████ █████ ████  █████████████  
▒▒███▒▒███ ▒▒███ ▒▒███ ▒▒███ ▒▒███▒▒███▒▒███ 
 ▒███ ▒███  ▒███  ▒███  ▒███  ▒███ ▒███ ▒███ 
 ▒███ ▒███  ▒▒███ ███   ▒███  ▒███ ▒███ ▒███ 
 ████ █████  ▒▒█████    █████ █████▒███ █████
▒▒▒▒ ▒▒▒▒▒    ▒▒▒▒▒    ▒▒▒▒▒ ▒▒▒▒▒ ▒▒▒ ▒▒▒▒▒ 
                                             
				]],
				[[
                                          /$$              
                                         |__/              
 /$$$$$$$   /$$$$$$   /$$$$$$  /$$    /$$ /$$ /$$$$$$/$$$$ 
| $$__  $$ /$$__  $$ /$$__  $$|  $$  /$$/| $$| $$_  $$_  $$
| $$  \ $$| $$$$$$$$| $$  \ $$ \  $$/$$/ | $$| $$ \ $$ \ $$
| $$  | $$| $$_____/| $$  | $$  \  $$$/  | $$| $$ | $$ | $$
| $$  | $$|  $$$$$$$|  $$$$$$/   \  $/   | $$| $$ | $$ | $$
|__/  |__/ \_______/ \______/     \_/    |__/|__/ |__/ |__/
                                                           
                                                           
                                                           
				]],
				[[
	                                  
	   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣿⣶⣿⣦⣼⣆         
	    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦      
	          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄    
	           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄   
	          ⢠⣿⣿⣿⠈    ⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀  
	   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘  ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄ 
	  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄  
	 ⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄ 
	 ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇ ⠛⠻⢷⣄
	      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆    
	       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃    
				]],
				keys = {

					{ icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
					{
						icon = " ",
						key = "g",
						desc = "Grep",
						action = ":lua Snacks.dashboard.pick('live_grep')",
					},
					{
						icon = " ",
						key = "r",
						desc = "Recent Files",
						action = ":lua Snacks.dashboard.pick('oldfiles')",
					},
					{
						icon = " ",
						key = "c",
						desc = "Config",
						action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
					},
					{ icon = "", key = "w", desc = "Restore Last Session", action = "<cmd>AutoSession restore<CR>" },
					{
						icon = "󰒲 ",
						key = "l",
						desc = "Lazy",
						action = ":Lazy",
						enabled = package.loaded.lazy ~= nil,
					},
					{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
				},
			},
			sections = {
				{ section = "header" },
				{ section = "keys", gap = 1, padding = 1 },
				{ section = "startup" },
			},
		},
	},

	keys = function()
		local Snacks = require("snacks")
		return {
			{
				"<leader>sf",
				function()
					Snacks.picker.files()
				end,
				desc = "[S]earch [F]iles",
			},
			{
				"<leader>sg",
				function()
					Snacks.picker.grep()
				end,
				desc = "[S]earch by [G]rep",
			},
			{
				"<leader>sh",
				function()
					Snacks.picker.help()
				end,
				desc = "[S]earch [H]elp",
			},
			{
				"<leader>sk",
				function()
					Snacks.picker.keymaps()
				end,
				desc = "[S]earch [K]eymaps",
			},
			{
				"<leader>ss",
				function()
					Snacks.picker.pickers()
				end,
				desc = "[S]earch [S]elect Picker",
			},
			{
				"<leader>sw",
				function()
					Snacks.picker.grep_word()
				end,
				desc = "[S]earch current [W]ord",
			},
			{
				"<leader>sd",
				function()
					Snacks.picker.diagnostics()
				end,
				desc = "[S]earch [D]iagnostics",
			},
			{
				"<leader>sr",
				function()
					Snacks.picker.resume()
				end,
				desc = "[S]earch [R]esume",
			},
			{
				"<leader>s.",
				function()
					Snacks.picker.recent()
				end,
				desc = '[S]earch Recent Files ("." for repeat)',
			},
			{
				"<leader>b",
				function()
					Snacks.picker.buffers()
				end,
				desc = "[ ] Find existing buffers",
			},

			{
				"<leader>/",
				function()
					Snacks.picker.lines({
						layout = {
							preset = "ivy",
							preview = false,
						},
					})
				end,
				desc = "[/] Fuzzily search in current buffer",
			},

			{
				"<leader>s/",
				function()
					Snacks.picker.grep({
						open = true,
					})
				end,
				desc = "[S]earch [/] in Open Files",
			},

			{
				"<leader>sn",
				function()
					Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
				end,
				desc = "[S]earch [N]eovim files",
			},
		}
	end,
}

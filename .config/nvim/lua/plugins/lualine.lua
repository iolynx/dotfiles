return {
	"nvim-lualine/lualine.nvim",
	config = function()
		local kanagawa = require("kanagawa.colors").setup()
		local palette_colors = kanagawa.palette
		local transparentbg = nil

		local conditions = {
			buffer_not_empty = function()
				return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
			end,
			hide_in_width = function()
				return vim.fn.winwidth(0) > 80
			end,
			check_git_workspace = function()
				local filepath = vim.fn.expand("%:p:h")
				local gitdir = vim.fn.finddir(".git", filepath .. ";")
				return gitdir and #gitdir > 0 and #gitdir < #filepath
			end,
		}

		local config = {
			options = {
				component_separators = "",
				section_separators = "",
				theme = {
					-- bg = transparentbg for transparent background
					normal = { c = { fg = palette_colors.sumiInk0 or "#ffffff" } },
					inactive = { c = { fg = palette_colors.sumiInk0 or "#ffffff" } },
				},
			},
			sections = {
				-- these are to remove the defaults
				lualine_a = {},
				lualine_b = {},
				lualine_y = {},
				lualine_z = {},
				-- These will be filled later
				lualine_c = {},
				lualine_x = {},
			},
			inactive_sections = {
				-- these are to remove the defaults
				lualine_a = {},
				lualine_b = {},
				lualine_y = {},
				lualine_z = {},
				lualine_c = {},
				lualine_x = {},
			},
		}

		local function ins_left(component)
			table.insert(config.sections.lualine_c, component)
		end

		local function ins_right(component)
			table.insert(config.sections.lualine_x, component)
		end

		-- left items

		ins_left({
			"mode",
			gui = "bold",
			color = function()
				local mode_color = {
					n = palette_colors.oldWhite,
					i = palette_colors.springGreen,
					v = palette_colors.springBlue,
					[""] = palette_colors.springBlue,
					V = palette_colors.autumnGreen,
				}
				return { bg = mode_color[vim.fn.mode()] or palette_colors.sakuraPink, fg = transparentbg }
			end,
			-- padding = { right = 1 }
		})

		-- ins_left { 'location' }

		ins_left({
			"branch",
			cond = conditions.check_git_workspace,
			icon = "",
			color = { fg = palette_colors.sakuraPink },
		})

		ins_left({
			"filename",
			cond = conditions.buffer_not_empty,
			color = { fg = palette_colors.dragonGray, gui = "bold" },
		})

		-- right items

		ins_right({
			"fileformat",
			fmt = string.upper,
			icons_enabled = true,
			color = { fg = palette_colors.oldWhite, gui = "bold" },
		})

		ins_right({
			"diagnostics",
			sources = { "nvim_diagnostic" },
			always_visible = true,
			sections = { "error", "warn", "hint" },
			symbols = { error = "", warn = "", info = "", hint = "" },
			diagnostics_color = {
				error = { fg = palette_colors.sakuraPink },
				warn = { fg = palette_colors.roninYellow },
				info = { fg = palette_colors.waveBlue2 },
				hint = { fg = palette_colors.springViolet2 },
			},
		})
		--
		ins_right({
			"filetype",
			color = { fg = palette_colors.springViolet1 },
		})

		ins_right({
			"progress",
			color = { fg = palette_colors.springViolet2, gui = "bold" },
		})

		ins_right({
			function()
				return os.date("%I:%M %p")
			end,
			color = { fb = transparentbg, bg = palette_colors.dragonGray },
		})

		-- ins_right {
		--   function()
		--     -- return '▊'
		--   end,
		--   color = { fg = palette_colors.oldWhite },
		--   padding = { left = 1 },
		-- }

		require("lualine").setup(config)
	end,
}

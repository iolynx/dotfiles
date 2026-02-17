return {
	{
		"rebelot/kanagawa.nvim",
		priority = 1000,
		lazy = false,
		opts = {
			compile = true,
			dimInactive = true,
			transparent = true,
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
			terminalColors = true,
			colors = {
				theme = {
					all = {
						ui = {
							bg_gutter = "none",
						},
					},
				},
			},
		},

		overrides = function(colors)
			local theme = colors.theme
			return {
				NormalFloat = { bg = "none" },
				FloatBorder = { bg = "none" },
				FloatTitle = { bg = "none" },

				TelescopeNormal = { fg = theme.ui.fg_dim },
				TelescopeTitle = { fg = theme.ui.special, bold = true },
				TelescopePromptNormal = { bg = theme.ui.bg_p1 },
				TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
				TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
				TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
				TelescopePreviewNormal = { bg = theme.ui.bg_dim },
				TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },

				BlinkCmpMenuSelection = { fg = theme.ui.bg_dm },
			}
		end,

		config = function(_, opts)
			require("kanagawa").setup(opts)
			-- vim.cmd.colorscheme("kanagawa-wave")
		end,
	},
}

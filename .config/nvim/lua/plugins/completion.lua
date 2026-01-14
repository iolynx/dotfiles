return {
	{
		"saghen/blink.cmp",
		-- enabled = false,
		dependencies = "rafamadriz/friendly-snippets",

		version = "v0.*",
		opts = {
			-- 'default' for mappings similar to built-in completion
			-- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
			-- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
			-- see the "default configuration" section below for full documentation on how to define
			-- your own keymap.
			keymap = { preset = "super-tab" },

			-- draw = {
			-- 	columns = {
			-- 		{ "label", "label description", gap = 1 },
			-- 		{ "kind_icon", "kind" },
			-- 	},
			-- },

			completion = {
				menu = { winblend = 0, border = "single" },
				documentation = { auto_show = true, auto_show_delay_ms = 300, window = { border = "single" } },
			},

			appearance = {
				use_nvim_cmp_as_default = true,
				-- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
				-- Adjusts spacing to ensure icons are aligned
				nerd_font_variant = "normal",
			},

			-- default list of enabled providers defined so that you can extend it
			-- elsewhere in your config, without redefining it, via `opts_extend`
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
				-- optionally disable cmdline completions
				-- cmdline = {},
			},

			signature = {
				enabled = true,
				window = { border = "single" },
			},
		},
		opts_extend = { "sources.default" },
	},
}

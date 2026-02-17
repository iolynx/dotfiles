return {
	"xiyaowong/transparent.nvim",

	enabled = true,
	event = "UIEnter",
	config = function()
		require("transparent").setup({
			-- table: default groups
			-- table: additional groups that should be cleared
			extra_groups = {
				"TelescopeBorder",
				"TelescopeTitle",
				"NormalFloat",
				"Tabline",
				"TablineFill",
				"TablineSel",
				"BufferTabpageFill",
				"BufferTabpages",
				"BufferTabpagesSep",
				"BufferDefaultTabpages",

				"BufferCurrentMod",
				"BufferInactiveMod",
				"BufferOffset",

				"BufferInactive",
				"BufferCurrent",

				"BufferCurrentIcon",
				"BufferInactiveIcon",
				"BufferCurrentSign",
				"BufferCurrentSignRight",
				"BufferInactiveSign",
				"BufferInactiveSignRight",

				"BlinkCmpMenu",
				"BlinkCmpMenuBorder",
				"BlinkCmpMenuBorder",
				"FloatBorder",
			},
			-- table: groups you don't want to clear
			exclude_groups = {
				"CursorLine",
			},
			-- function: code to be executed after highlight groups are cleared
			-- Also the user event "TransparentClear" will be triggered
			on_clear = function() end,
		})
		vim.api.nvim_create_autocmd("ColorScheme", {
			callback = function()
				vim.cmd("TransparentEnable")
			end,
		})
	end,
}

return {
	"folke/noice.nvim",
	opts = {
		notify = {
			enabled = true,
		},
		routes = {
			{
				filter = {
					event = "msg_show",
					find = "BufferLineCycle", -- This catches both Prev and Next
				},
				opts = { skip = true },
			},
			{
				view = "notify", -- Send to the sliding notification view
				filter = { event = "msg_show", find = "yanked" }, -- Catch "yanked" messages
			},
			{
				view = "notify",
				filter = { event = "msg_show", find = "written" }, -- Catch ":w" (written) messages
			},
			{
				filter = { event = "msg_show", find = "search hit BOTTOM" },
				opts = { skip = true },
			},
		},
	},
}

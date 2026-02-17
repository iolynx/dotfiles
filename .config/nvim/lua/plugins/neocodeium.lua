return {
	"monkoose/neocodeium",
	event = "VeryLazy",
	config = function()
		local neocodeium = require("neocodeium")
		neocodeium.setup()
		vim.keymap.set("i", "<C-l>", function()
			require("neocodeium").accept()
		end, { silent = true, noremap = true })
	end,
}

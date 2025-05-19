return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" }, -- optional, for icons
	config = function()
		require("lualine").setup({
			options = {
				theme = "solarized-osaka",
				icons_enabled = true,
				component_separators = "|",
			},
		})
	end,
}

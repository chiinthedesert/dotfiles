vim.pack.add({
    -- zenbones
    "https://github.com/rktjmp/lush.nvim",
    "https://github.com/zenbones-theme/zenbones.nvim",

    -- alabaster
    -- "https://github.com/sderev/alabaster.vim",
    "https://github.com/mcncl/alabaster.nvim",

    -- lualine
    "https://github.com/echasnovski/mini.icons",
    "https://github.com/nvim-lualine/lualine.nvim",
})

-- vim.g.zenbones_darken_comments = 45
-- vim.cmd.colorscheme("duckbones")
vim.cmd.colorscheme("alabaster")

require("lualine").setup({
    options = {
        theme = "auto",
    },
})

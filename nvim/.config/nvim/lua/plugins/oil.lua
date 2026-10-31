vim.pack.add({
    "https://github.com/nvim-mini/mini.icons",
    "https://github.com/stevearc/oil.nvim",
})

require("mini.icons").setup()

require("oil").setup({
    delete_to_trash = true,
    skip_confirm_for_simple_edits = true,

    columns = {
        "icon",
        -- "permissions",
        "size",
        -- "mtime",
    },

    float = {
        max_width = 0.8,
        max_height = 0.8,
    },
    view_options = {
        show_hidden = true,
    },
    keymaps = {},
})

vim.keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "open parent directory" })

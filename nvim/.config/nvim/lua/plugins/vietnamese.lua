vim.pack.add({
    "https://github.com/sontungexpt/vietnamese.nvim",
})

require("vietnamese").setup({
    enabled = false,
})
vim.keymap.set("n", "<leader>vt", "<CMD>VietnameseToggle<CR>", { desc = "toggle vietnamese" })

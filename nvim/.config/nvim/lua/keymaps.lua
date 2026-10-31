-- clear hightlight
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { silent = true })

-- incre
vim.keymap.set("n", "<CR>", function()
    vim.treesitter.select("parent")
end, { desc = "select syntax node" })

vim.keymap.set("x", "<CR>", function()
    vim.treesitter.select("parent")
end, { desc = "expand to parent node" })

vim.keymap.set("x", "<S-CR>", function()
    vim.treesitter.select("child")
end, { desc = "shrink to child node" })

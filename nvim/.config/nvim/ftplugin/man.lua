vim.keymap.set("n", "]]", function()
  vim.fn.search([[^\u]], "W")
end, { buffer = true, silent = true, desc = "next man section" })

vim.keymap.set("n", "[[", function()
  vim.fn.search([[^\u]], "bW")
end, { buffer = true, silent = true, desc = "previous man section" })

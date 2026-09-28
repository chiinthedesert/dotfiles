-- Clear search highlights on <Esc>, preserving standard Esc behavior
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "clear search highlight" })

vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>", { desc = "exit terminal mode" })

-- Buffer navigation

-- Diagnostics
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "line diagnostics" })

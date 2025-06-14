vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.keymap.set("n", ",", ":")

-- Sets sane defaults (noremap=true, silent=true)
local function map(mode, lhs, rhs, opts)
  local defaults = {
    noremap = true,
    silent = true,
  }
  if opts then
    defaults = vim.tbl_deep_extend("force", defaults, opts)
  end
  vim.keymap.set(mode, lhs, rhs, defaults)
end

map("n", "<leader>sa", "gg<S-v>G", { desc = "Select all" })

map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search hightlights" })
map("n", "<leader>n", "<cmd>bnext<CR>", { desc = "Buffer: Next" })
map("n", "<leader>p", "<cmd>bprevious<CR>", { desc = "Buffer: Previous" })
map("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Buffer: Close current" })

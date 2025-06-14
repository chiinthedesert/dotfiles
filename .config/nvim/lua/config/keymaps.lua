-- It sets sane defaults (noremap=true, silent=true)
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


vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', ',', ':')



map("n", "<leader>n", "<cmd>bnext<CR>", { desc = 'Buffer: Next' })
map("n", "<leader>p", "<cmd>bprevious<CR>", { desc = "Buffer: Previous" })
map("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Buffer: Close current"})

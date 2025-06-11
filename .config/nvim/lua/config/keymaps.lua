local map = vim.keymap.set

local base_map_opts = { noremap = true, silent = true }

-- Helper function to create final map options by merging base_map_opts
-- with a description and any per-map specific options.
local function MOpts(description, per_map_specific_opts)
  local opts_with_desc = { desc = description }
  local merged_specifics = vim.tbl_extend("force", {}, per_map_specific_opts or {}, opts_with_desc)
  return vim.tbl_extend("force", {}, base_map_opts, merged_specifics)
end

-- ; instead of :
map("n", ";", ":", MOpts("Enter command", {silent = false}))

-- Keymap to copy current file's absolute path
map("n", "<leader>cp", "<cmd>let @+ = expand('%:p')<CR>", MOpts("Copy absolute path"))

-- Keymap to Yank (Copy) all lines in the current buffer to system clipboard
map("n", "<leader>ya", "ggVGy", MOpts("Yank all"))

-- Panes shortcuts
map("n", "<leader>\\", "<C-w>v", MOpts("Split window vertically"))
map("n", "<leader>-", "<C-w>s", MOpts("Split window horizontally"))
map("n", "<leader>x", "<cmd>close<CR>", MOpts("Close current window"))

-- Buffer Navigation
map("n", "<leader>n", "<cmd>bnext<CR>", MOpts("Buffer: Next"))
map("n", "<leader>p", "<cmd>bprevious<CR>", MOpts("Buffer: Previous"))
map("n", "<leader>bd", "<cmd>bdelete<CR>", MOpts("Buffer: Close current"))
-- map("n", "<leader>bl", "<cmd>ls<CR>", MOpts("Buffer: List all"))
map("n", "<leader>bo", function()
  local current_win = vim.api.nvim_get_current_win()
  local windows = vim.api.nvim_tabpage_list_wins(0)
  for _, win_id in ipairs(windows) do
    if win_id ~= current_win then
      vim.api.nvim_win_close(win_id, false)
    end
  end
end, MOpts("Buffer: Only this window"))

-- ... (other keymaps can follow this pattern) ...

vim.keymap.set("n", "<leader>r", function()
  vim.cmd("write")

  local file = vim.fn.expand("%:p")
  local command = "uv run " .. vim.fn.shellescape(file)

  vim.cmd("split | terminal " .. command)
end, {
  buffer = true,
  desc = "run python file",
})

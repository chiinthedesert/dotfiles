vim.keymap.set("n", "<leader>r", function()
  vim.cmd("write")

  local file = vim.fn.expand("%:p")
  local command = "gcc " .. vim.fn.shellescape(file) .. " -o /tmp/program && /tmp/program"

  vim.cmd("split | terminal " .. command)
end, {
  buffer = true,
  desc = "run c file",
})

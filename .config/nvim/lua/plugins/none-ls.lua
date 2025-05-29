return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.stylua,
      },
    })

    vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format, { desc = "Format buffer (none-ls)" })
  end,
}

return {
  "sontungexpt/vietnamese.nvim",
  dependencies = {
    "sontungexpt/bim.nvim",
  },
  event = "InsertEnter",
  opts = {
    enabled = false,
  },
  keys = {
    {
      "<leader>tv",
      "<cmd>VietnameseToggle<CR>",
      mode = "n",
      desc = "Toggle Vietnamese IME"
    },
    {
      "<leader>tm",
      "<cmd>VietnameseMethod<CR>",
      mode = "n",
      desc = "Switch Vietnamese Input Method"
    }
  }
}

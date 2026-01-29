return {
  -- Comment
  {
    "numToStr/Comment.nvim",
    keys = { "gc", "gcc" },
    opts = {
      -- add any options here
    },
  },

  -- Dummy text
  {
    'derektata/lorem.nvim',
    event = "InsertCharPre",
    config = function()
      require("lorem").opts {
        sentence_length = "mixed", -- using a default configuration
        comma_chance = 0.3, -- 30% chance to insert a comma
        max_commas = 2, -- maximum 2 commas per sentence
        debounce_ms = 200, -- default debounce time in milliseconds
      }
    end
  },

  -- Formatter
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      {
        "<leader>fm",
        function()
          require("conform").format({ async = true })
        end,
        mode = "",
        desc = "Format buffer",
      },
    },
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        html = { "prettierd", "prettier", stop_after_first = true },
        css = { "prettierd", "prettier", stop_after_first = true },
        javascript = { "prettierd", "prettier", stop_after_first = true },
      },
    },
  },
}

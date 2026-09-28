return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {},
    opts = {
      -- Define your formatters
      formatters_by_ft = {
        lua = { "stylua" },
        vue = { "prettierd" },
        javascript = { "prettierd" },
        html = { "prettierd" },
        css = { "prettierd" },
        json = { "prettierd" },
        python = { "ruff_organize_imports", "ruff_format" },
        c = { "clang-format" },
        sh = { "shfmt" },
        bash = { "shfmt" },
      },
      -- Set default options
      default_format_opts = {
        lsp_format = "fallback",
      },
      -- Set up format-on-save
      format_on_save = { timeout_ms = 500 },
      -- Customize formatters
      formatters = {
        shfmt = {
          append_args = { "-i", "2" },
        },
        stylua = {
          prepend_args = { "--indent-type", "Spaces", "--indent-width", "2" },
        },
        -- Added: fix Ruff formatting for Jupytext notebooks
        ruff_format = {
          args = function(_, ctx)
            local filename = ctx.filename

            if filename:match("%.ipynb$") then
              filename = filename .. ".py"
            end

            return { "format", "--stdin-filename", filename, "-" }
          end,
        },

        -- Added: fix Ruff import sorting for Jupytext notebooks
        ruff_organize_imports = {
          args = function(_, ctx)
            local filename = ctx.filename

            if filename:match("%.ipynb$") then
              filename = filename .. ".py"
            end

            return { "check", "--select", "I", "--fix", "--stdin-filename", filename, "-" }
          end,
        },
      },
    },
    init = function()
      -- If you want the formatexpr, here is the place to set it
      vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
  },
}

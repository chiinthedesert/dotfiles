vim.pack.add({
    "https://github.com/stevearc/conform.nvim",
})

require("conform").setup({
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
            prepend_args = { "--indent-type", "Spaces", "--indent-width", "4" },
        },
    },
})

vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

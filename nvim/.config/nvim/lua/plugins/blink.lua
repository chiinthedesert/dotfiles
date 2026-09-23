return {
  "saghen/blink.cmp",
  dependencies = { "rafamadriz/friendly-snippets" },

  version = "1.*",
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = { preset = "default" },

    appearance = {
      nerd_font_variant = "mono",
    },

    completion = {
      documentation = { auto_show = false },
      accept = { auto_brackets = { enabled = true } },
    },

    cmdline = {
      keymap = { preset = "inherit" },
      completion = { menu = { auto_show = true } },
    },
    term = {
      enabled = true,
      completion = { menu = { auto_show = true } },
    },

    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
      -- per_filetype = {
      --   markdown = { "lsp", "dictionary" },
      -- },
    },

    fuzzy = { implementation = "prefer_rust_with_warning" },
  },

  opts_extend = { "sources.default" },
}

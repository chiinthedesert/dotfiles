return {
  {
    "chomosuke/typst-preview.nvim",
    lazy = false, -- or ft = 'typst'
    -- enabled = false,
    version = "1.*",
    opts = {
      extra_args = { "--font-path", "fonts" },
    },
  },
}

return {
  {
    "brenoprata10/nvim-highlight-colors",

    ft = {
      "css",
      "scss",
      "html",
      "vue",
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
    },

    opts = {
      -- subtle color square instead of recoloring the text itself
      render = "virtual",
      virtual_symbol = "■",
      virtual_symbol_position = "inline",
      virtual_symbol_suffix = " ",

      -- unambiguous color syntax
      enable_hex = true,
      enable_short_hex = true,
      enable_rgb = true,
      enable_hsl = true,

      -- don't blindly highlight words like "black", "red", "blue"
      -- cssls can provide these contextually through documentColor
      enable_named_colors = false,

      -- don't interpret unrelated terminal escape sequences as colors
      enable_ansi = false,
      enable_xterm256 = false,
      enable_xtermTrueColor = false,

      -- too broad for normal web code
      enable_hsl_without_function = false,

      -- useful for CSS variables
      enable_var_usage = true,

      -- let tailwindcss LSP identify actual Tailwind colors
      -- instead of scanning every class name ourselves
      enable_tailwind = false,
    },
  },
}

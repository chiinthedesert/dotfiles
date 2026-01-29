return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPost", "BufNewFile" },
  build = ":TSUpdate",
  config = function () 
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = { "c", "lua", "vim", "vimdoc", "css", "json", "markdown", "javascript", "html" },
      sync_install = false,

      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = { enable = true },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
            ["a)"] = "@parameter.outer",
            ["i)"] = "@parameter.inner",
            ["a("] = "@parameter.outer",
            ["i("] = "@parameter.inner",
            ["a}"] = "@block.outer",
            ["i}"] = "@block.inner",
            ["a{"] = "@block.outer",
            ["i{"] = "@block.inner",
            ["aa"] = "@parameter.outer",
            ["ia"] = "@parameter.inner",
            ["as"] = "@statement.outer",
            ["is"] = "@statement.inner",
          },
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            ["]]"] = "@function.outer",
            ["]m"] = "@class.outer",
          },
          goto_next_end = {
            ["]["] = "@function.outer",
            ["]M"] = "@class.outer",
          },
          goto_previous_start = {
            ["[["] = "@function.outer",
            ["[m"] = "@class.outer",
          },
          goto_previous_end = {
            ["[]"] = "@function.outer",
            ["[M"] = "@class.outer",
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ["<leader>a"] = "@parameter.inner",
          },
          swap_previous = {
            ["<leader>A"] = "@parameter.inner",
          },
        },
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<cr>",
          node_incremental = "<cr>",
          -- scope_incremental = "<bs>",
          node_decremental = "<bs>",
        },
      },
    })
  end
}

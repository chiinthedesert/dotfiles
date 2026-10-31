vim.pack.add({
    "https://github.com/nvim-treesitter/nvim-treesitter",
    "https://github.com/nvim-treesitter/nvim-treesitter-textobjects",
})

require("nvim-treesitter").install({ "lua", "c", "zig", "python" })

-- NVIM-TREESITTER-TEXTOBJECTS
vim.g.no_plugin_maps = true
require("nvim-treesitter-textobjects").setup({
    select = {
        -- Automatically jump forward to textobj, similar to targets.vim
        lookahead = true,
        -- You can choose the select mode (default is charwise 'v')
        --
        -- Can also be a function which gets passed a table with the keys
        -- * query_string: eg '@function.inner'
        -- * method: eg 'v' or 'o'
        -- and should return the mode ('v', 'V', or '<c-v>') or a table
        -- mapping query_strings to modes.
        selection_modes = {
            ["@parameter.outer"] = "v", -- charwise
            ["@function.outer"] = "V", -- linewise
            -- ['@class.outer'] = '<c-v>', -- blockwise
        },
        -- If you set this to `true` (default is `false`) then any textobject is
        -- extended to include preceding or succeeding whitespace. Succeeding
        -- whitespace has priority in order to act similarly to eg the built-in
        -- `ap`.
        --
        -- Can also be a function which gets passed a table with the keys
        -- * query_string: eg '@function.inner'
        -- * selection_mode: eg 'v'
        -- and should return true of false
        include_surrounding_whitespace = false,
    },

    move = {
        -- whether to set jumps in the jumplist
        set_jumps = true,
    },
})

-- select
vim.keymap.set({ "x", "o" }, "am", function()
    require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects")
end, { desc = "select around function" })

vim.keymap.set({ "x", "o" }, "im", function()
    require("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects")
end, { desc = "select inside function" })

vim.keymap.set({ "x", "o" }, "af", function()
    require("nvim-treesitter-textobjects.select").select_textobject("@call.outer", "textobjects")
end, { desc = "select around function call" })

vim.keymap.set({ "x", "o" }, "if", function()
    require("nvim-treesitter-textobjects.select").select_textobject("@call.inner", "textobjects")
end, { desc = "select inside function call" })

vim.keymap.set({ "x", "o" }, "ac", function()
    require("nvim-treesitter-textobjects.select").select_textobject("@class.outer", "textobjects")
end, { desc = "select around class" })

vim.keymap.set({ "x", "o" }, "ic", function()
    require("nvim-treesitter-textobjects.select").select_textobject("@class.inner", "textobjects")
end, { desc = "select inside class" })

vim.keymap.set({ "x", "o" }, "as", function()
    require("nvim-treesitter-textobjects.select").select_textobject("@local.scope", "locals")
end, { desc = "select local scope" })

-- swap
vim.keymap.set("n", "<leader>a", function()
    require("nvim-treesitter-textobjects.swap").swap_next("@parameter.inner")
end, { desc = "swap with next parameter" })

vim.keymap.set("n", "<leader>A", function()
    require("nvim-treesitter-textobjects.swap").swap_previous("@parameter.outer")
end, { desc = "swap with previous parameter" })

-- move
vim.keymap.set({ "n", "x", "o" }, "]m", function()
    require("nvim-treesitter-textobjects.move").goto_next_start("@function.outer", "textobjects")
end, { desc = "next function start" })

vim.keymap.set({ "n", "x", "o" }, "]]", function()
    require("nvim-treesitter-textobjects.move").goto_next_start("@class.outer", "textobjects")
end, { desc = "next class start" })

vim.keymap.set({ "n", "x", "o" }, "]o", function()
    require("nvim-treesitter-textobjects.move").goto_next_start({ "@loop.inner", "@loop.outer" }, "textobjects")
end, { desc = "next loop start or end" })

vim.keymap.set({ "n", "x", "o" }, "]s", function()
    require("nvim-treesitter-textobjects.move").goto_next_start("@local.scope", "locals")
end, { desc = "next local scope" })

vim.keymap.set({ "n", "x", "o" }, "]z", function()
    require("nvim-treesitter-textobjects.move").goto_next_start("@fold", "folds")
end, { desc = "next fold start" })

vim.keymap.set({ "n", "x", "o" }, "]M", function()
    require("nvim-treesitter-textobjects.move").goto_next_end("@function.outer", "textobjects")
end, { desc = "next function end" })

vim.keymap.set({ "n", "x", "o" }, "][", function()
    require("nvim-treesitter-textobjects.move").goto_next_end("@class.outer", "textobjects")
end, { desc = "next class end" })

vim.keymap.set({ "n", "x", "o" }, "[m", function()
    require("nvim-treesitter-textobjects.move").goto_previous_start("@function.outer", "textobjects")
end, { desc = "previous function start" })

vim.keymap.set({ "n", "x", "o" }, "[[", function()
    require("nvim-treesitter-textobjects.move").goto_previous_start("@class.outer", "textobjects")
end, { desc = "previous class start" })

vim.keymap.set({ "n", "x", "o" }, "[M", function()
    require("nvim-treesitter-textobjects.move").goto_previous_end("@function.outer", "textobjects")
end, { desc = "previous function end" })

vim.keymap.set({ "n", "x", "o" }, "[]", function()
    require("nvim-treesitter-textobjects.move").goto_previous_end("@class.outer", "textobjects")
end, { desc = "previous class end" })

vim.keymap.set({ "n", "x", "o" }, "]c", function()
    require("nvim-treesitter-textobjects.move").goto_next("@conditional.outer", "textobjects")
end, { desc = "next conditional" })

vim.keymap.set({ "n", "x", "o" }, "[c", function()
    require("nvim-treesitter-textobjects.move").goto_previous("@conditional.outer", "textobjects")
end, { desc = "previous conditional" })

-- repeat
local ts_repeat_move = require("nvim-treesitter-textobjects.repeatable_move")

vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move, { desc = "repeat last move forward" })
vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite, { desc = "repeat last move backward" })
vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f_expr, { expr = true, desc = "find character forward" })
vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F_expr, { expr = true, desc = "find character backward" })
vim.keymap.set(
    { "n", "x", "o" },
    "t",
    ts_repeat_move.builtin_t_expr,
    { expr = true, desc = "move until character forward" }
)
vim.keymap.set(
    { "n", "x", "o" },
    "T",
    ts_repeat_move.builtin_T_expr,
    { expr = true, desc = "move until character backward" }
)

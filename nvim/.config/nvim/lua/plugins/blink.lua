vim.pack.add({
    "https://github.com/saghen/blink.lib",
    "https://github.com/saghen/blink.cmp",
    "https://github.com/rafamadriz/friendly-snippets",

    "https://github.com/zbirenbaum/copilot.lua",
    "https://github.com/zbirenbaum/copilot.lua",
    "https://github.com/fang2hou/blink-copilot",
})

local cmp = require("blink.cmp")
cmp.build():pwait()

require("copilot").setup({
    suggestion = { enabled = false },
    panel = { enabled = false },
    filetypes = {
        markdown = true,
        help = true,
    },
})

cmp.setup({
    -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
    -- 'super-tab' for mappings similar to vscode (tab to accept)
    -- 'enter' for enter to accept
    -- 'none' for no mappings
    --
    -- All presets have the following mappings:
    -- C-space: Open menu or open docs if already open
    -- C-n/C-p or Up/Down: Select next/previous item
    -- C-e: Hide menu
    -- C-k: Toggle signature help (if signature.enabled = true)
    --
    -- See :h blink-cmp-config-keymap for defining your own keymap
    keymap = {
        preset = "default",
    },

    cmdline = {
        keymap = {
            preset = "inherit",
        },
        completion = {
            menu = {
                auto_show = true,
            },
        },
    },

    -- (Default) Only show the documentation popup when manually triggered
    completion = { documentation = { auto_show = false } },

    -- (Default) list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    sources = {
        default = { "lsp", "path", "snippets", "buffer", "copilot" },
        providers = {
            copilot = {
                name = "copilot",
                module = "blink-copilot",
                score_offset = 100,
                async = true,
            },
        },
    },

    -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
    -- You may use a lua implementation instead by using `implementation = "lua"`
    -- See the fuzzy documentation for more information
    fuzzy = { implementation = "rust" },
})

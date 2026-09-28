return {
  {
    "goerz/jupytext.nvim",
    version = "0.2.0",
    opts = {
      format = "py:percent",
    },
  },

  {
    "Vigemus/iron.nvim",
    ft = { "python" },

    config = function()
      local iron = require("iron.core")
      local view = require("iron.view")
      local common = require("iron.fts.common")
      local visibility = require("iron.visibility")
      local scope = require("iron.scope")

      iron.setup({
        config = {
          --------------------
          -- REPL BEHAVIOR --
          --------------------

          -- How the REPL window behaves when toggled
          visibility = visibility.toggle,
          -- visibility = visibility.single,
          -- visibility = visibility.focus,

          -- How REPL sessions are shared
          scope = scope.path_based,
          -- scope = scope.tab_based,
          -- scope = scope.singleton,

          -- Use scratch buffers for REPLs
          scratch_repl = false,

          -- Automatically close the window when the REPL exits
          close_window_on_exit = true,

          -- Show REPL buffers in the buffer list
          buflisted = false,

          -- Highlight the last code block sent to the REPL
          highlight_last = "IronLastSent",
          -- highlight_last = false,

          -- Enable legacy <Plug> mappings
          should_map_plug = false,

          -- Send code to the DAP REPL during debugging
          dap_integration = false,

          ----------------------
          -- REPL DEFINITION --
          ----------------------

          repl_definition = {
            python = {
              -- User-wide IPython installation
              command = { "ipython", "--no-autoindent" },

              -- Alternative: IPython installed in the uv project
              -- command = { "uv", "run", "ipython", "--no-autoindent" },

              -- Alternative: ordinary Python
              -- command = { "uv", "run", "python" },

              -- Handle multiline Python code
              format = common.bracketed_paste_python,

              -- Jupytext / Jupyter cell markers
              block_dividers = {
                "# %%",
                "#%%",
              },

              -- Environment variables for ordinary Python 3.13+
              -- env = { PYTHON_BASIC_REPL = "1" },
            },
          },

          -- Filetype assigned to REPL buffers
          repl_filetype = function(_, _)
            return "iron"
          end,

          -------------------
          -- REPL WINDOW --
          -------------------

          -- Vertical split on the right, occupying 45% of the editor
          repl_open_cmd = view.split.vertical.botright("45%"),

          -- Alternative: equal vertical split
          -- repl_open_cmd = view.split.vertical.botright("50%"),

          -- Alternative: horizontal split at the bottom
          -- repl_open_cmd = view.split.botright(15),

          -- Alternative: floating window on the right
          -- repl_open_cmd = view.right("45%"),

          -- Alternative: centered floating window
          -- repl_open_cmd = view.center("80%", "80%"),

          -- Alternative: allow automatic resizing of the REPL split
          -- repl_open_cmd = view.split.vertical.botright("45%", {
          --   winfixwidth = false,
          --   winfixheight = false,
          -- }),
        },

        -------------
        -- KEYMAPS --
        -------------

        keymaps = {
          toggle_repl = "<leader>sr",
          restart_repl = "<leader>sR",

          send_motion = "<leader>sc",
          visual_send = "<leader>sc",
          send_file = "<leader>sf",
          send_line = "<leader>sl",
          send_paragraph = "<leader>sp",
          send_until_cursor = "<leader>su",

          send_code_block = "<leader>sb",
          send_code_block_and_move = "<leader>sn",

          send_mark = "<leader>sm",
          mark_motion = "<leader>mc",
          mark_visual = "<leader>mc",
          remove_mark = "<leader>md",

          cr = "<leader>s<cr>",
          interrupt = "<leader>s<space>",
          exit = "<leader>sq",
          clear = "<leader>cl",

          clear_hl = "<leader>sh",
        },

        -- highlight = {
        --   bold = true,
        --   italic = true,
        -- },

        ignore_blank_lines = true,
      })
    end,
  },
}

return {
  {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
      image = {
        resolve = function(path, src)
          local api = require("obsidian.api")
          if api.path_is_note(path) then
            return api.resolve_attachment_path(src)
          end
        end,
      },
    },
  },
}

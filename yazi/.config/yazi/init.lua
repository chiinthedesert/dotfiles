-- You can configure your bookmarks by lua language
local bookmarks = {}

require("zoxide"):setup({
  update_db = true,
})

require("git"):setup({
  -- Order of status signs showing in the linemode
  order = 1500,
})

-- ~/.config/yazi/init.lua
require("my-relative-motions"):setup({
  show_numbers = "relative_absolute",
  show_motion = true,
  enter_mode = "first",
})

require("yamb"):setup({
  -- Optional, the path ending with path seperator represents folder.
  bookmarks = bookmarks,
  -- Optional, recieve notification everytime you jump.
  jump_notify = true,
  -- Optional, the cli of fzf.
  cli = "fzf",
  -- Optional, a string used for randomly generating keys, where the preceding characters have higher priority.
  keys = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ",
  -- Optional, the path of bookmarks
  path = (ya.target_family() == "windows" and os.getenv("APPDATA") .. "\\yazi\\config\\bookmark")
    or (os.getenv("HOME") .. "/.config/yazi/bookmark"),
})

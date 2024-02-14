version = '0.21.3'

-- plugins
local home = os.getenv("HOME")
package.path = home
    .. "/.config/xplr/plugins/?/init.lua;"
    .. home
    .. "/.config/xplr/plugins/?.lua;"
    .. package.path


-- fuzzy file finder
require("fzf").setup({
  key = "/",
  bin = "fzf",
  args = "--preview 'pistol {}'",
  recursive = true,  -- If true, search all files under $PWD
  enter_dir = false, -- Enter if the result is directory
});

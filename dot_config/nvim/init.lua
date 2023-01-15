local vim = vim
local g = vim.g

--------- Disable builtin plugins -----------
g.loaded_zip = 1
g.loaded_zipPlugin = 1
g.loaded_tar = 1
g.loaded_tarPlugin = 1
-- g.loaded_gzip = 1

g.loaded_vimball = 1
g.loaded_vimballPlugin = 1

-- Currently broken, https://github.com/nvim-treesitter/nvim-treesitter/issues/1049
g.loaded_2html_plugin = 1

g.loaded_remote_plugins = 1
vim["loaded_spellfile_plugin"] = 1
vim.g.loaded_tutor_mode_plugin = 1

g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
g.loaded_netrwSettings = 1
g.loaded_netrwFileHandlers = 1
g.loaded_netrw_gitignore = 1

---------------- Base configs ----------------
require("base_config")

---------------- Load Plugins ----------------
require("plugin_loading")

----------------- Load Theme -----------------
vim.cmd([[colorscheme lunaperche]])

-- Some extra changes on top of the theme.
require("theme")

---------------- Set KeyMaps -----------------
require("keymapping")

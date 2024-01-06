local g = vim.g

------------ Disable Providers --------------
g.loaded_python3_provider = 0

---------------- Base configs ----------------
require("base_config")

----------------- Load Theme -----------------
vim.cmd([[colorscheme lunaperche]])

-- Some extra changes on top of the theme.
require("theme")

---------------- Load Plugins ----------------
require("plugin_loading")

---------------- Set KeyMaps -----------------
require("keymapping")

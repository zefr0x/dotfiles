--------------- Base configs ----------------
require("base_config")

---------------- Load Plugins ----------------
require("plugin_loading")

----------------- Load Theme -----------------
vim.cmd([[colorscheme lunaperche]])

-- Some extra changes on top of the theme.
require("theme")

---------------- Set KeyMaps -----------------
require("keymapping")

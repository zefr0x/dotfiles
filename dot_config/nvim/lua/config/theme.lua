local highlite = vim.api.nvim_set_hl

-- github-nvim-theme
require('github-theme').setup {
    theme_style = "dark_default",
    dark_float = true,
}

-- Fix fidget highliting and use better color
highlite(0, "FidgetTask", { fg="#58a6ff" })

-- nvim-cmp theme
highlite(0, "PmenuSel", { fg = nil, bg = "#282C34" })
highlite(0, "Pmenu", { fg = "#C5CDD9", bg = "#22252A" })

highlite(0, "CmpItemAbbrDeprecated", { fg = "#7E8294", bg = nil, strikethrough = true })
highlite(0, "CmpItemAbbrMatch", { fg = "#82AAFF", bg = nil, bold = true })
highlite(0, "CmpItemAbbrMatchFuzzy", { fg = "#82AAFF", bg = nil, bold = true})
highlite(0, "CmpItemMenu", { fg = "#C792EA", bg = nil, italic = true})

highlite(0, "CmpItemKindField", { fg = "#EED8DA", bg = "#B5585F" })
highlite(0, "CmpItemKindProperty", { fg = "#EED8DA", bg = "#B5585F" })
highlite(0, "CmpItemKindEvent", { fg = "#EED8DA", bg = "#B5585F" })

highlite(0, "CmpItemKindText", { fg = "#C3E88D", bg = "#9FBD73" })
highlite(0, "CmpItemKindEnum", { fg = "#C3E88D", bg = "#9FBD73" })
highlite(0, "CmpItemKindKeyword", { fg = "#C3E88D", bg = "#9FBD73" })

highlite(0, "CmpItemKindConstant", { fg = "#FFE082", bg = "#D4BB6C" })
highlite(0, "CmpItemKindConstructor", { fg = "#FFE082", bg = "#D4BB6C" })
highlite(0, "CmpItemKindReference", { fg = "#FFE082", bg = "#D4BB6C" })

highlite(0, "CmpItemKindFunction", { fg = "#EADFF0", bg = "#A377BF" })
highlite(0, "CmpItemKindStruct", { fg = "#EADFF0", bg = "#A377BF" })
highlite(0, "CmpItemKindClass", { fg = "#EADFF0", bg = "#A377BF" })
highlite(0 , "CmpItemKindModule", { fg = "#EADFF0", bg = "#A377BF" })
highlite(0, "CmpItemKindOperator", { fg = "#EADFF0", bg = "#A377BF" })

highlite(0, "CmpItemKindVariable", { fg = "#C5CDD9", bg = "#7E8294" })
highlite(0, "CmpItemKindFile", { fg = "#C5CDD9", bg = "#7E8294" })

highlite(0, "CmpItemKindUnit", { fg = "#F5EBD9", bg = "#D4A959" })
highlite(0, "CmpItemKindSnippet", { fg = "#F5EBD9", bg = "#D4A959" })
highlite(0, "CmpItemKindFolder", { fg = "#F5EBD9", bg = "#D4A959" })

highlite(0, "CmpItemKindMethod", { fg = "#DDE5F5", bg = "#6C8ED4" })
highlite(0, "CmpItemKindValue", { fg = "#DDE5F5", bg = "#6C8ED4" })
highlite(0, "CmpItemKindEnumMember", { fg = "#DDE5F5", bg = "#6C8ED4" })

highlite(0, "CmpItemKindInterface", { fg = "#D8EEEB", bg = "#58B5A8" })
highlite(0, "CmpItemKindColor", { fg = "#D8EEEB", bg = "#58B5A8" })
highlite(0, "CmpItemKindTypeParameter", { fg = "#D8EEEB", bg = "#58B5A8" })

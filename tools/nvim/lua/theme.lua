local hl = vim.api.nvim_set_hl

------------ Theme modifications -------------

-- Show another background in floating windows
hl(0, "NormalFloat", { bg = "#101010" })

-- Keep the Todo theming for the todo-comments.nvim plugin
hl(0, "Todo", { fg = nil, bg = nil })

-- VIM modes
hl(0, "Visual", { fg = "#000000", bg = "#ff4500" })

-- Diff
hl(0, "DiffAdd", { fg = "#000000", bg = "#34d058" })
hl(0, "DiffChange", { fg = "#000000", bg = "#e2c08d" })
hl(0, "DiffText", { fg = "#000000", bg = "#5fd7d7" })
hl(0, "DiffDelete", { fg = "#ea4a5a", bg = nil })
hl(0, "diffAdded", { fg = "#34d058", bg = nil })
hl(0, "diffRemoved", { fg = "#ea4a5a", bg = nil })
hl(0, "diffSubname", { fg = "#ff87ff", bg = nil })

-- Git Signs
hl(0, "GitSignsAdd", { link = "diffAdded" })
-- hl(0, "GitSignsAddLn", { link = "GitSignsAdd" })
hl(0, "GitSignsChange", { fg = "#e2c08d", bg = nil })
hl(0, "GitSignsDelete", { link = "diffRemoved" })
-- hl(0, "GitSignsDeleteLn", { link = "" })

-- LSP
hl(0, "DiagnosticError", { fg = "#d22222" })
hl(0, "DiagnosticWarn", { fg = "#ff8c00" })
hl(0, "DiagnosticsHint", { fg = "#f0e68c" })
hl(0, "DiagnosticsInformation", { fg = "#00bfff" })

hl(0, "DiagnosticUnderlineError", { sp = "#d22222", undercurl = true })
hl(0, "DiagnosticsUnderlineWarning", { sp = "#ff8c00", undercurl = true })
hl(0, "DiagnosticsUnderlineHint", { sp = "#f0e68c", undercurl = true })
hl(0, "DiagnosticsUnderlineInformation", { sp = "#00bfff", undercurl = true })

hl(0, "LspDiagnosticsError", { link = "DiagnosticError" })
hl(0, "LspDiagnosticsWarning", { link = "DiagnosticWarn" })
hl(0, "LspDiagnosticHint", { link = "DiagnosticsHint" })
hl(0, "LspDiagnosticInfo", { link = "DiagnosticsInformation" })

hl(0, "LspDiagnosticUnderlineError", { link = "DiagnosticsUnderlineError" })
hl(0, "LspDiagnosticUnderlineWarn", { link = "DiagnosticsUnderlineWarning" })
hl(0, "LspDiagnosticUnderlineHint", { link = "DiagnosticsUnderlineHint" })
hl(0, "LspDiagnosticUnderlineInfo", { link = "DiagnosticsUnderlineInformation" })

hl(0, "InlineHint", { fg = "#282828" })

-- Popup Menu
hl(0, "Pmenu", { bg = "#080808" })
hl(0, "PmenuSel", { fg = nil, bg = "#252525" })
-- hl(0, "PmenuSbar", { fg = nil, bg = "" })
-- hl(0, "PmenuThumb", { fg = nil, bg = "" })

-- Plugins theming --------------------

-- todo-comments.nvim -----
-- Colors are in the plugin's config file.

-- trouble.nvim -----------
-- hl(0, "TroubleCount", {})
-- hl(0, "TroubleNormal", {})
-- hl(0, "TroubleLocation", {})
-- hl(0, "TroublePreview", {})
-- hl(0, "TroubleIndent", {})
-- hl(0, "TroubleSource", {})
-- hl(0, "TroubleFoldIcon", {})
-- hl(0, "TroubleCode", {})
-- hl(0, "TroubleFile", {})
-- hl(0, "TroubleText", {})
--
-- hl(0, "TroubleError", {})
-- hl(0, "TroubleWarning", {})
-- hl(0, "TroubleHint", {})
-- hl(0, "TroubleInformation", {})
--
-- hl(0, "TroubleSignError", {})
-- hl(0, "TroubleSignWarning", {})
-- hl(0, "TroubleSignHint", {})
-- hl(0, "TroubleSignInformation", {})
-- hl(0, "TroubleSignOther", {})
--
-- hl(0, "TroubleTextError", {})
-- hl(0, "TroubleTextWarning", {})
-- hl(0, "TroubleTextHint", {})
-- hl(0, "TroubleTextInformation", {})

-- nvim-cmp ---------------
hl(0, "CmpItemMenu", { fg = "#C792EA", bg = nil, italic = true })
hl(0, "CmpItemAbbr", { fg = "#c6c6c6", bg = nil })
hl(0, "CmpItemAbbrMatch", { fg = "#ff4500", bg = nil, bold = true })
hl(0, "CmpItemAbbrMatchFuzzy", { fg = "#ff4500", bg = nil, bold = true })
hl(0, "CmpItemAbbrDeprecated", { fg = "#8b0000", bg = nil, strikethrough = true })

-- hl(0, "CmpDocumentation", { fg = "", bg = "" })
-- hl(0, "CmpDocumentationBorder", { fg = "", bg = "" })

hl(0, "CmpItemKindDefault", { fg = "#c6c6c6" })

hl(0, "CmpItemKindField", { fg = "#B5585F" })
hl(0, "CmpItemKindProperty", { fg = "#B5585F" })
hl(0, "CmpItemKindEvent", { fg = "#B5585F" })

hl(0, "CmpItemKindText", { fg = "#C3E88D" })
hl(0, "CmpItemKindEnum", { fg = "#C3E88D" })
hl(0, "CmpItemKindKeyword", { fg = "#C3E88D" })

hl(0, "CmpItemKindConstant", { fg = "#D4BB6C" })
hl(0, "CmpItemKindConstructor", { fg = "#D4BB6C" })
hl(0, "CmpItemKindReference", { fg = "#D4BB6C" })

hl(0, "CmpItemKindFunction", { fg = "#A377BF" })
hl(0, "CmpItemKindStruct", { fg = "#A377BF" })
hl(0, "CmpItemKindClass", { fg = "#A377BF" })
hl(0, "CmpItemKindModule", { fg = "#A377BF" })
hl(0, "CmpItemKindOperator", { fg = "#A377BF" })

hl(0, "CmpItemKindVariable", { fg = "#7E8294" })
hl(0, "CmpItemKindFile", { fg = "#7E8294" })

hl(0, "CmpItemKindUnit", { fg = "#D4A959" })
hl(0, "CmpItemKindSnippet", { fg = "#D4A959" })
hl(0, "CmpItemKindFolder", { fg = "#D4A959" })

hl(0, "CmpItemKindMethod", { fg = "#6C8ED4" })
hl(0, "CmpItemKindValue", { fg = "#6C8ED4" })
hl(0, "CmpItemKindEnumMember", { fg = "#6C8ED4" })

hl(0, "CmpItemKindInterface", { fg = "#58B5A8" })
hl(0, "CmpItemKindColor", { fg = "#58B5A8" })
hl(0, "CmpItemKindTypeParameter", { fg = "#58B5A8" })

-- indent-blankline.nvim --
hl(0, "IndentBlanklineIndent1", { bg = "#000000", nocombine = true })
hl(0, "IndentBlanklineIndent2", { bg = "#070707", nocombine = true })
-- TODO: Chnage color.
hl(0, "IndentBlankLineScope", { fg = "#ffffff", nocombine = true })

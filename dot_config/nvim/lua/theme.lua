local hl = vim.api.nvim_set_hl

----------- zer0-x theme extention -----------

hl(0, "NormalFloat", { bg = "#101010" }) -- Normal text in floating windows

-- LSP theming
-- TODO: define the non lsp then define lsp.
hl(0, "LspDiagnosticsError", { fg = "#d22222" })
hl(0, "LspDiagnosticsWarning", { fg = "#ff8c00" })
hl(0, "LspDiagnosticsHint", { fg = "#f0e68c" })
hl(0, "LspDiagnosticsInformation", { fg = "#00bfff" })

hl(0, "LspDiagnosticUnderlineError", { sp = "#d22222", undercurl = true })
hl(0, "LspDiagnosticsUnderlineWarning", { sp = "#ff8c00", undercurl = true })
hl(0, "LspDiagnosticsUnderlineHint", { sp = "#f0e68c", undercurl = true })
hl(0, "LspDiagnosticsUnderlineInformation", { sp = "#00bfff", undercurl = true })

hl(0, "DiagnosticError", { link = "LspDiagnosticsError" })
hl(0, "DiagnosticWarn", { link = "LspDiagnosticsWarning" })
hl(0, "DiagnosticHint", { link = "LspDiagnosticsHint" })
hl(0, "DiagnosticInfo", { link = "LspDiagnosticsInformation" })

hl(0, "DiagnosticUnderlineError", { link = "LspDiagnosticsUnderlineError" })
hl(0, "DiagnosticUnderlineWarn", { link = "LspDiagnosticsUnderlineWarning" })
hl(0, "DiagnosticUnderlineHint", { link = "LspDiagnosticsUnderlineHint" })
hl(0, "DiagnosticUnderlineInfo", { link = "LspDiagnosticsUnderlineInformation" })

-- Plugins theming --------------------

-- todo-comments.nvim
-- Colors are it the plugin's config file.

-- trouble.nvim --------
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

-- fidget.nvim ---------
hl(0, "FidgetTitle", { fg = "#800000", bold = true })
hl(0, "FidgetTask", { fg = "#58a6ff" })

-- nvim-cmp ------------
hl(0, "PmenuSel", { fg = nil, bg = "#282C34" })
hl(0, "Pmenu", { fg = "#C5CDD9", bg = "#22252A" })

hl(0, "CmpItemAbbrDeprecated", { fg = "#7E8294", bg = nil, strikethrough = true })
hl(0, "CmpItemAbbrMatch", { fg = "#82AAFF", bg = nil, bold = true })
hl(0, "CmpItemAbbrMatchFuzzy", { fg = "#82AAFF", bg = nil, bold = true })
hl(0, "CmpItemMenu", { fg = "#C792EA", bg = nil, italic = true })

hl(0, "CmpItemKindField", { fg = "#EED8DA", bg = "#B5585F" })
hl(0, "CmpItemKindProperty", { fg = "#EED8DA", bg = "#B5585F" })
hl(0, "CmpItemKindEvent", { fg = "#EED8DA", bg = "#B5585F" })

hl(0, "CmpItemKindText", { fg = "#C3E88D", bg = "#9FBD73" })
hl(0, "CmpItemKindEnum", { fg = "#C3E88D", bg = "#9FBD73" })
hl(0, "CmpItemKindKeyword", { fg = "#C3E88D", bg = "#9FBD73" })

hl(0, "CmpItemKindConstant", { fg = "#FFE082", bg = "#D4BB6C" })
hl(0, "CmpItemKindConstructor", { fg = "#FFE082", bg = "#D4BB6C" })
hl(0, "CmpItemKindReference", { fg = "#FFE082", bg = "#D4BB6C" })

hl(0, "CmpItemKindFunction", { fg = "#EADFF0", bg = "#A377BF" })
hl(0, "CmpItemKindStruct", { fg = "#EADFF0", bg = "#A377BF" })
hl(0, "CmpItemKindClass", { fg = "#EADFF0", bg = "#A377BF" })
hl(0, "CmpItemKindModule", { fg = "#EADFF0", bg = "#A377BF" })
hl(0, "CmpItemKindOperator", { fg = "#EADFF0", bg = "#A377BF" })

hl(0, "CmpItemKindVariable", { fg = "#C5CDD9", bg = "#7E8294" })
hl(0, "CmpItemKindFile", { fg = "#C5CDD9", bg = "#7E8294" })

hl(0, "CmpItemKindUnit", { fg = "#F5EBD9", bg = "#D4A959" })
hl(0, "CmpItemKindSnippet", { fg = "#F5EBD9", bg = "#D4A959" })
hl(0, "CmpItemKindFolder", { fg = "#F5EBD9", bg = "#D4A959" })

hl(0, "CmpItemKindMethod", { fg = "#DDE5F5", bg = "#6C8ED4" })
hl(0, "CmpItemKindValue", { fg = "#DDE5F5", bg = "#6C8ED4" })
hl(0, "CmpItemKindEnumMember", { fg = "#DDE5F5", bg = "#6C8ED4" })

hl(0, "CmpItemKindInterface", { fg = "#D8EEEB", bg = "#58B5A8" })
hl(0, "CmpItemKindColor", { fg = "#D8EEEB", bg = "#58B5A8" })
hl(0, "CmpItemKindTypeParameter", { fg = "#D8EEEB", bg = "#58B5A8" })

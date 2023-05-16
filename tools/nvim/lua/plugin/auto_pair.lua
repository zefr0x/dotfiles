-- nvim-autopairs
local npairs = require("nvim-autopairs")
local Rule = require("nvim-autopairs.rule")
local cond = require("nvim-autopairs.conds")
local ts_conds = require("nvim-autopairs.ts-conds")

npairs.setup({
	disable_filetype = { "TelescopePrompt" },
	check_ts = true,
	ts_config = {
		lua = { "string" }, -- it will not add a pair on that treesitter node
		javascript = { "template_string" },
	},
})

-- press % => %% only while inside a comment or string
npairs.add_rules({
	Rule("%", "%", "lua"):with_pair(ts_conds.is_ts_node({ "string", "comment" })),
	Rule("$", "$", "lua"):with_pair(ts_conds.is_not_ts_node({ "function" })),
})

-- Add spaces between parentheses
npairs.add_rules({
	Rule(" ", " "):with_pair(function(opts)
		local pair = opts.line:sub(opts.col - 1, opts.col)
		return vim.tbl_contains({ "()", "[]", "{}" }, pair)
	end),
	Rule("( ", " )")
		:with_pair(function()
			return false
		end)
		:with_move(function(opts)
			return opts.prev_char:match(".%)") ~= nil
		end)
		:use_key(")"),
	Rule("{ ", " }")
		:with_pair(function()
			return false
		end)
		:with_move(function(opts)
			return opts.prev_char:match(".%}") ~= nil
		end)
		:use_key("}"),
	Rule("[ ", " ]")
		:with_pair(function()
			return false
		end)
		:with_move(function(opts)
			return opts.prev_char:match(".%]") ~= nil
		end)
		:use_key("]"),
})

-- arrow key on javascript
npairs.add_rule(
	Rule("%(.*%)%s*%=>$", " {  }", { "typescript", "typescriptreact", "javascript" })
		:use_regex(true)
		:set_end_pair_length(2)
)

-- auto addspace on =
npairs.add_rule(Rule("=", "")
	:with_pair(cond.not_inside_quote())
	:with_pair(function(opts)
		local last_char = opts.line:sub(opts.col - 1, opts.col - 1)
		if last_char:match("[%w%=%s]") then
			return true
		end
		return false
	end)
	:replace_endpair(function(opts)
		local prev_2char = opts.line:sub(opts.col - 2, opts.col - 1)
		local next_char = opts.line:sub(opts.col, opts.col)
		next_char = next_char == " " and "" or " "
		if prev_2char:match("%w$") then
			return "<bs> =" .. next_char
		end
		if prev_2char:match("%=$") then
			return next_char
		end
		if prev_2char:match("=") then
			return "<bs><bs>=" .. next_char
		end
		return ""
	end)
	:set_end_pair_length(0)
	:with_move(cond.none()))

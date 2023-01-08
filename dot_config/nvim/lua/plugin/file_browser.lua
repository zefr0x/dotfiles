-- Natural string comparison algorithem
--
-- References:
--     https://github.com/lifthrasiir/rust-natord/blob/93e5f0ace208e73ddfaaa77ec1605584c8f22a14/lib.rs#L142
--     https://github.com/lifthrasiir/rust-natord/blob/93e5f0ace208e73ddfaaa77ec1605584c8f22a14/lib.rs#L37
local function natural_cmp(left, right)
	left = left.name:lower()
	right = right.name:lower()

	for i = 1, string.len(left), 1 do
		local l = string.sub(left, i, -1)
		local r = string.sub(right, i, -1)

		if l == r then
			return false
		elseif type(tonumber(string.sub(l, 1, 1))) == "number" and type(tonumber(string.sub(r, 1, 1))) == "number" then
			return tonumber(string.match(l, "^[0-9]+")) < tonumber(string.match(r, "^[0-9]+"))
		elseif l[1] == r[1] then
			goto continue
		else
			return l < r
		end
		::continue::
	end
end

-- nvim-tree.lua
require("nvim-tree").setup({
	sort_by = function(nodes)
		table.sort(nodes, natural_cmp)
	end,
	renderer = {
		special_files = { "Cargo.toml", "README.md", "readme.md" },
	},
	filters = {
		custom = { "^.git$", "^.env$" },
	},
})

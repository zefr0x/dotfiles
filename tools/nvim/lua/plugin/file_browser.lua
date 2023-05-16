-- Natural string comparison algorithem
--
-- References:
--     https://github.com/lifthrasiir/rust-natord/blob/93e5f0ace208e73ddfaaa77ec1605584c8f22a14/lib.rs#L142
--     https://github.com/lifthrasiir/rust-natord/blob/93e5f0ace208e73ddfaaa77ec1605584c8f22a14/lib.rs#L37
local function natural_cmp(left, right)
	left = left.name:lower()
	right = right.name:lower()

	if left == right then
		return false
	end

	for i = 1, math.max(string.len(left), string.len(right)), 1 do
		local l = string.sub(left, i, -1)
		local r = string.sub(right, i, -1)

		if type(tonumber(string.sub(l, 1, 1))) == "number" and type(tonumber(string.sub(r, 1, 1))) == "number" then
			local l_number = tonumber(string.match(l, "^[0-9]+"))
			local r_number = tonumber(string.match(r, "^[0-9]+"))

			-- When the same number in the start of the window, there might be numbers later.
			if l_number ~= r_number then
				return l_number < r_number
			end
		elseif string.sub(l, 1, 1) ~= string.sub(r, 1, 1) then
			return l < r
		end
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

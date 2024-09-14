local M = {}

-- Config
M.split_ratio = 1.618

--- @alias AspectRatio
--- | "horizontal"
--- | "vertical"

--- @param win number? the number of the window to get the orientation of (0 for current window)
--- @return AspectRatio
local function win_get_orientation(win)
	win = win or 0
	local w = vim.api.nvim_win_get_width(win)
	local h = vim.api.nvim_win_get_height(win) * 2.2051282051

	if w > h then
		return "horizontal"
	else
		return "vertical"
	end
end

local function gsplit()
	local aspect_ratio = win_get_orientation(0)
	if aspect_ratio == "horizontal" then
		vim.cmd("vsplit")
	else
		vim.cmd("split")
	end
end

function M.setup(opts)
	opts = opts or {}
	M.split_ratio = opts.split_ratio or M.split_ratio

	vim.api.nvim_create_user_command("SaneSplits", gsplit, {})
end

M.win_get_orientation = win_get_orientation

return M

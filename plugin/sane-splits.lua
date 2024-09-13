local NVIM_VERSION = "nvim-0.10.0"

if vim.fn.has(NVIM_VERSION) ~= 1 then
	vim.api.nvim_err_writeln("gsplit.nvim requires at least nvim version " .. NVIM_VERSION)
end

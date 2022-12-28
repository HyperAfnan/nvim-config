local borders = {
	"NotifyINFOBorder",
	"NotifyERRORBorder",
	"NotifyWARNBorder",
	"NotifyDEBUGBorder",
	"NotifyTRACEBorder",
}
local icons = { "NotifyINFOIcon", "NotifyERRORIcon", "NotifyWARNIcon", "NotifyDEBUGIcon", "NotifyTRACEIcon" }
local titles = { "NotifyINFOTitle", "NotifyERRORTitle", "NotifyWARNTitle", "NotifyDEBUGTitle", "NotifyTRACETitle" }
local bodies = { "NotifyINFOBody", "NotifyERRORBody", "NotifyWARNBody", "NotifyDEBUGBody", "NotifyTRACEBody" }
vim.api.nvim_set_hl(0, "NotifyBg", { fg = "#1f2335", bg = "#1f2335" })
vim.api.nvim_set_hl(0, "NotifyFg", { fg = "#a9b1d6", bg = "#1f2335" })
vim.api.nvim_set_hl(0, "NotifyIcon", { fg = "#7dcfff", bg = "#1f2335" })
vim.api.nvim_set_hl(0, "NotifyTitle", { fg = "#7dcfff", bg = "#1f2335" })

for _, borderGroups in ipairs(borders) do
	vim.api.nvim_set_hl(0, borderGroups, { link = "NotifyBg" })
end
for _, iconGroups in ipairs(icons) do
	vim.api.nvim_set_hl(0, iconGroups, { link = "NotifyIcon" })
end
for _, titleGroups in ipairs(titles) do
	vim.api.nvim_set_hl(0, titleGroups, { link = "NotifyTitle" })
end
for _, bodyGroups in ipairs(bodies) do
	vim.api.nvim_set_hl(0, bodyGroups, { link = "NotifyFg" })
end

local notify = require("notify")
local default = {
	stages = "fade_in_slide_out",
	render = "default",
	timeout = 2000,
	minimum_width = 10,
	icons = {
		ERROR = "",
		WARN = "",
		INFO = "",
		DEBUG = "",
		TRACE = "",
	},
}

vim.opt.termguicolors = true

notify.setup(default)

vim.notify = function(msg, level, opts)
	notify(msg, level, opts)
end

function _G.P(...)
	print(vim.inspect(...))
	return ...
end

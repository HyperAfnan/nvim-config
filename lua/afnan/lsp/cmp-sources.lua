---@diagnostic disable: unused-local
local sources = {
	{ name = "luasnip", max_item_count = 2, option = { show_autosnippets = true } },
	{ name = "nvim_lsp", max_item_count = 4 },
	{ name = "nvim_lsp_signature_help" },
	{ name = "buffer", max_item_count = 2 },
	{ name = "path" },
	{ name = "devicons", priority = 500 },
}

if vim.o.ft == "lua" then
	table.insert(sources, { name = "nvim_lua" })
end

if vim.o.ft == "zsh" then
	table.insert(sources, { name = "zsh" })
	require("cmp_zsh").setup({
		zshrc = true,
		filetypes = { "zsh" },
	})
end

if vim.fn.expand("%:t") == "plugins.lua" then
	table.insert(sources, { name = "plugins" })
end

--- Reference: https://github.com/hrsh7th/nvim-cmp/discussions/702
--- nvim-web-devicons source for nvim-cmp
function _G.DeviconsCompletion()
	local cmp = require("cmp")
	local devicons = require("nvim-web-devicons")
	cmp.register_source("devicons", {
		complete = function(self, params, callback)
			local items = {}
			for _, icon in pairs(devicons.get_icons()) do
				table.insert(items, {
					label = icon.icon .. "  " .. icon.name,
					insertText = icon.icon,
					filterText = icon.name,
				})
			end
			callback({ items = items })
		end,
	})
end
vim.api.nvim_create_user_command("CmpDevicons", _G.DeviconsCompletion, {})

return sources

---@diagnostic disable: unused-local
local ls = require("luasnip")
local types = require("luasnip.util.types")

ls.config.set_config({
	history = true,
	updateevent = "TextChanged,TextChangedI",
	enable_autosnippets = true,
	ft_func = function()
		return vim.split(vim.bo.filetype, ".", true)
	end,
	ext_opts = {
		[types.choiceNode] = {
			active = {
				virt_text = { { "<-", "Error" } },
			},
		},
	},
})

require("luasnip.loaders.from_vscode").lazy_load()

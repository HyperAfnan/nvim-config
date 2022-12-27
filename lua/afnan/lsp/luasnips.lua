---@diagnostic disable: unused-local
local ls = require("luasnip")

ls.config.set_config({
	history = true,
	updateevent = "TextChanged,TextChangedI",
	enable_autosnippets = true,
})

ls.snippets = {
	lua = {
		ls.parser.parse_snippet("lr", [[ local $1 = require($2)$0 ]]),
	},
}

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--single-branch",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
end
vim.opt.runtimepath:prepend(lazypath)

require("lazy").setup({
	{
		"nvim-telescope/telescope.nvim",
		config = function()
			require("afnan.telescope")
		end,
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
	},
	{
		"nathom/filetype.nvim",
		config = function()
			require("filetype").setup({ overrides = { complex = { [".luacheckrc"] = "lua" } } })
		end,
	},
	{
		"folke/tokyonight.nvim",
		config = function()
			vim.cmd("colorscheme tokyonight")
		end,
	},
	{ "tweekmonster/startuptime.vim", pin = true, cmd = "StartupTime" },
	"kyazdani42/nvim-web-devicons",

	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("afnan.treesitter")
		end,
		dependencies = {
			{ "windwp/nvim-ts-autotag", ft = { "html", "javascript", "javascriptreact" } },
			{ "p00f/nvim-ts-rainbow" },
			{ "JoosepAlviste/nvim-ts-context-commentstring" },
		},
	},
	"windwp/nvim-autopairs",
	{
		"numToStr/Comment.nvim",
		config = function()
			require("afnan.comments")
		end,
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("afnan.lsp.language-servers")
		end,
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			{ "b0o/SchemaStore.nvim", pin = true },
		},
	},
	{
		"hrsh7th/nvim-cmp",
		config = function()
			require("afnan.lsp.cmp")
		end,
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"saadparwaiz1/cmp_luasnip",
		},
	},
	{
		"L3MON4D3/LuaSnip",
		config = function()
			require("afnan.lsp.luasnips")
		end,
		dependencies = {
			"rafamadriz/friendly-snippets",
			"saadparwaiz1/cmp_luasnip",
		},
	},
})

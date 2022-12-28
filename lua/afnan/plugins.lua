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
		"ethanholz/nvim-lastplace",
		event = "BufRead",
		config = function()
			require("nvim-lastplace").setup({
				lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
				lastplace_ignore_filetype = { "gitcommit", "gitrebase", "svn", "hgcommit" },
				lastplace_open_folds = true,
			})
		end,
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
		"rcarriga/nvim-notify",
		config = function()
			require("afnan.notify")
		end,
	},
	{
		"petertriho/nvim-scrollbar",
		config = function()
			local colors = require("tokyonight.colors").setup()
			require("scrollbar").setup({
				handler = {
					gitsigns = true,
					color = colors.bg_highlight,
				},
				marks = {
					Search = { color = colors.orange },
					Error = { color = colors.error },
					Warn = { color = colors.warning },
					Info = { color = colors.info },
					Hint = { color = colors.hint },
					Misc = { color = colors.purple },
				},
			})
		end,
	},

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
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("afnan.autopairs")
		end,
	},
	{
		"numToStr/Comment.nvim",
		keys = { "gc", "gcc", "gb", "gbc" },
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
			"hrsh7th/cmp-nvim-lsp-signature-help",
			{ "tamago324/cmp-zsh", ft = "zsh" },
			{
				"KadoBOT/cmp-plugins",
				config = function()
					require("cmp-plugins").setup({
						files = { "plugins.lua" },
					})
				end,
			},
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
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				signcolumn = true,
				numhl = false,
			})
			require("scrollbar.handlers.gitsigns").setup()
		end,
	},
})

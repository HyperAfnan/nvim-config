vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
	use({ "nvim-telescope/telescope.nvim", requires = { { "nvim-lua/plenary.nvim" } } })
	use({
		"nathom/filetype.nvim",
		config = function()
			require("filetype").setup({ overrides = { complex = { [".luacheckrc"] = "lua" } } })
		end,
	})
	use({
		"folke/tokyonight.nvim",
		config = function()
			vim.cmd("colorscheme tokyonight")
		end,
	})
	use({ "tweekmonster/startuptime.vim", cmd = "StartupTime", lock = true })
	use("kyazdani42/nvim-web-devicons")

	-- Treesitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate", config = [[require('afnan.treesitter')]] })
	use({ "windwp/nvim-ts-autotag", ft = { "html", "javascript", "javascriptreact" }, after = "nvim-treesitter" })
	use({ "p00f/nvim-ts-rainbow" })
	use({ "JoosepAlviste/nvim-ts-context-commentstring", after = "Comment.nvim" })
	use({
		"windwp/nvim-autopairs",
		config = "require('afnan.autopairs')",
		after = "nvim-cmp",
	})
	use({
		"numToStr/Comment.nvim",
		keys = { "gcc", "gc", "gb", "gbc" },
		config = "require('afnan.comments')",
	})

	-- LSP
	use("neovim/nvim-lspconfig")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/nvim-cmp")
	use("saadparwaiz1/cmp_luasnip")
	use("L3MON4D3/LuaSnip")
end)

-- local function map(m, k, v)
-- 	vim.keymap.set(m, k, v, {})
-- end

return {
	-- "tpope/vim-sleuth",
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			vim.cmd("colorscheme catppuccin-mocha")
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			icons_enabled = true,
			theme = "catppuccin",
		},
	},
	{
		"nvim-tree/nvim-tree.lua",
		config = function()
			require("nvim-tree").setup()
			vim.keymap.set("n", "<leader>n", ":NvimTreeFindFileToggle<CR>", { silent = true })
		end,
	},
	{
		"numToStr/Comment.nvim",
		lazy = false,
		opts = {
			toggler = {
				line = "<C-c>",
				block = "<C-b>",
			},
			opleader = {
				line = "<C-c>",
				block = "<C-b>",
			},
			mappings = {
				basic = true,
				extra = false,
			},
		},
	},
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
				cond = function()
					return vim.fn.executable("make") == 1
				end,
			},
		},
		config = function()
			require("plugins.telescope")
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("plugins.treesitter")
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "williamboman/mason.nvim", config = true },
			"williamboman/mason-lspconfig.nvim",
			{ "j-hui/fidget.nvim", tag = "legacy", opts = {} },
			{
				"folke/neodev.nvim",
				opts = {},
			},
		},
		config = function()
			require("plugins.lsp")
		end,
	},
	{
		"mhartington/formatter.nvim",
		config = function()
			require("plugins.formatter")
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lsp",
			"rafamadriz/friendly-snippets",
		},
		config = function()
			require("plugins.cmp")
		end,
	},
	-- {
	-- 	"hrsh7th/nvim-cmp",
	-- 	dependencies = {
	-- 		"hrsh7th/cmp-nvim-lsp",
	-- 		"hrsh7th/cmp-nvim-lua",
	-- 		"hrsh7th/cmp-nvim-lsp-signature-help",
	-- 		"hrsh7th/cmp-vsnip",
	-- 		"hrsh7th/cmp-path",
	-- 		"hrsh7th/cmp-buffer",
	-- 		"hrsh7th/vim-vsnip",
	-- 	},
	-- 	config = function()
	-- 		require("plugins.cmpvs")
	-- 	end,
	-- },
	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			vim.opt.list = true
			vim.opt.listchars:append("eol:↴")

			require("indent_blankline").setup({
				char = "┊",
				show_end_of_line = true,
				space_char_blankline = " ",
				show_current_context = true,
				show_current_context_start = true,
			})
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		opts = {},
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {},
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			-- {
			-- 	"rcarriga/nvim-notify",
			-- 	opts = {
			-- 		stages = "fade_in_slide_out",
			-- 		timeout = 1000,
			-- 	},
			-- },
			"MunifTanjim/nui.nvim",
		},
		opts = {
			lsp = {
				-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			-- you can enable a preset for easier configuration
			presets = {
				bottom_search = true, -- use a classic bottom cmdline for search
				command_palette = true, -- position the cmdline and popupmenu together
				long_message_to_split = true, -- long messages will be sent to a split
				inc_rename = false, -- enables an input dialog for inc-rename.nvim
				lsp_doc_border = false, -- add a border to hover docs and signature help
			},
		},
	},
}

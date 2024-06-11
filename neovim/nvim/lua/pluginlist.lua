-- local function map(m, k, v)
-- 	vim.keymap.set(m, k, v, {})
-- end

return {
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
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {
            -- indent = {char = "▍┃"},
            indent = { char = "┃" },
        },
        -- config = function()
        -- 	vim.opt.list = true
        -- 	vim.opt.listchars:append("eol:↴")
        --
        -- 	-- require("ibl").setup({
        -- 	-- 	indent = {char = "█"},
        -- 	-- 	-- show_end_of_line = true,
        -- 	-- 	-- space_char_blankline = " ",
        -- 	-- 	-- show_current_context = true,
        -- 	-- 	-- show_current_context_start = true,
        -- 	-- })
        -- 	-- -- require("ibl").setup()
        -- end,
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
        dependencies = {
            -- {
            --     "nvim-treesitter/nvim-treesitter-context",
            --     opts = {
            --         enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
            --         max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
            --         min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
            --         line_numbers = true,
            --         multiline_threshold = 20, -- Maximum number of lines to show for a single context
            --         trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
            --         mode = 'cursor', -- Line used to calculate context. Choices: 'cursor', 'topline'
            --         -- Separator between context and content. Should be a single character string, like '-'.
            --         -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
            --         separator = nil,
            --         zindex = 20, -- The Z-index of the context window
            --         on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
            --     }
            -- }
        }
    },
    {
        "ThePrimeagen/harpoon",
        config = function()
            require("plugins.harpoon")
        end,
    },
    {
        "mbbill/undotree",
        config = function()
            require("plugins.undotree")
        end,
    },
    {
        "tpope/vim-fugitive",
        config = function()
            require("plugins.vim-fugitive")
        end,
    },
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },

            -- LSP
            {
                'mfussenegger/nvim-jdtls',
                config = function()
                    require("plugins.jdtls")
                end
            },
        },
        config = function()
            require("plugins.lsp")
        end
    },
    -- {
    --     "ErichDonGubler/lsp_lines.nvim",
    --     config = function()
    --         require("lsp_lines").setup()
    --         vim.keymap.set("n", "<leader>vd", function() require("lsp_lines").toggle() end, { desc = "Inline Diagnostics" })
    --     end,
    -- }
    { 'ThePrimeagen/vim-be-good' },
    { 'nvim-tree/nvim-tree.lua' },
}

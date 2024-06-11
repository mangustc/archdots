require("nvim-treesitter.configs").setup({
    -- Add languages to be installed here that you want installed for treesitter
    ensure_installed = { "c", "cpp", "lua", "python", "rust", "bash", "java", "kotlin", "html", "javascript", "css", "json", "go", "templ" },

    -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
    auto_install = true,

    highlight = {
        enable = true,
        adittional_regex_highlighting = false
    },
    indent = { enable = true },
    incremental_selection = {
        enable = true,
    },
})


-- vim.filetype.add({
--     extension = {
--         templ = "templ",
--     },
-- })

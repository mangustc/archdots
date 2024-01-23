require("telescope").setup({})

vim.keymap.set("n", "<leader>pf", require("telescope.builtin").find_files, { desc = "Search [F]iles" })
vim.keymap.set("n", "<leader>pg", require("telescope.builtin").live_grep, { desc = "Search by [G]rep" })
vim.keymap.set("n", "<leader>b", require("telescope.builtin").buffers, { desc = "Find existing [B]uffers" })
-- vim.keymap.set("n", "/", function()
--     require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
--         winblend = 20,
--         previewer = false,
--     }))
-- end, { desc = "[/] Fuzzily search in current buffer" })
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

pcall(require("telescope").load_extension, "fzf")

require("telescope").setup({})

vim.keymap.set("", "<leader>f", require("telescope.builtin").find_files, { desc = "Search [F]iles" })
vim.keymap.set("", "<leader>g", require("telescope.builtin").live_grep, { desc = "Search by [G]rep" })
vim.keymap.set("", "<leader>b", require("telescope.builtin").buffers, { desc = "Find existing [B]uffers" })
vim.keymap.set("n", "<leader>/", function()
	require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		winblend = 10,
		previewer = false,
	}))
end, { desc = "[/] Fuzzily search in current buffer" })

pcall(require("telescope").load_extension, "fzf")

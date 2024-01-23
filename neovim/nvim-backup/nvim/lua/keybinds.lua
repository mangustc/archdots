local function map(m, k, v)
    vim.keymap.set(m, k, v, {})
end
local function smap(m, k, v)
    vim.keymap.set(m, k, v, { silent = true })
end

----------
-- Base --
----------

map({ "n", "v" }, "<leader>y", [["+y]])
map("n", "<leader>Y", [["+Y]])
map("n", "<leader>yy", [["+yy]])
map({ "n", "v" }, "<leader>d", [["_d]])

-- map("n", "<leader>p", '"+p')
-- map("n", "<leader>P", '"+P')
-- map("v", "<leader>p", '"+p')
-- map("v", "<leader>P", '"+P')

map("n", "U", "<C-r>")
-- map("v", "U", "<nop>")
-- map("v", "u", "<nop>")
map("", "gu", "<nop>")
map("", "gU", "<nop>")

map("", "<F1>", "<nop>")
map("n", "Q", "<nop>")

smap("v", "J", ":m '>+1<CR>gv=gv")
smap("v", "K", ":m '<-2<CR>gv=gv")

map("n", "J", "mzJ`z")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

map("x", "<leader>p", [["_dP]])

map("n", "<leader>f", vim.lsp.buf.format)

-- smap("n", "<C-k>", "<cmd>cnext<CR>zz")
-- smap("n", "<C-j>", "<cmd>cprev<CR>zz")
smap("n", "<leader>k", "<cmd>lnext<CR>zz")
smap("n", "<leader>j", "<cmd>lprev<CR>zz")

map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
smap("n", "<leader>x", "<cmd>!chmod +x %<CR>")

-- map("", "G", "<nop>")
-- map("", "gl", "$")
-- map("", "gs", "^")
-- map("", "gh", "0")
-- map("", "ge", "[[")
-- map("", "gg", "G")
-- smap("", "gn", ":bnext<CR>")
-- smap("", "gp", ":bprevious<CR>")

-- map("x", "x", "<S-v>")

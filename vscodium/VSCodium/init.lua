local function map(m, k, v)
	vim.keymap.set(m, k, v, {})
end
local function smap(m, k, v)
	vim.keymap.set(m, k, v, { silent = true })
end

----------
-- Base --
----------

map("v", "<leader>y", '"+y')
map("n", "<leader>Y", '"+yg_')
map("n", "<leader>y", '"+y')
map("n", "<leader>yy", '"+yy')

map("n", "<leader>p", '"+p')
map("n", "<leader>P", '"+P')
map("v", "<leader>p", '"+p')
map("v", "<leader>P", '"+P')

map("n", "U", "<C-r>")
map("v", "U", "<nop>")
map("v", "u", "<nop>")
map("", "gu", "<nop>")
map("", "gU", "<nop>")

map("", "G", "<nop>")
map("", "gl", "$")
map("", "gs", "^")
map("", "gh", "0")
map("", "ge", "[[")
map("", "gg", "G")
smap("", "gn", ":bnext<CR>")
smap("", "gp", ":bprevious<CR>")

map("x", "x", "<S-v>")

smap("n", "J", ":move .+1<CR>==")
smap("n", "K", ":move .-2<CR>==")
smap("v", "J", ":move '>+1<CR>gv-gv")
smap("v", "K", ":move '<-2<CR>gv-gv")

map("", "<F1>", "<nop>")

vim.cmd(
	[[set langmap='q,\\,w,.e,pr,yt,fy,gu,ci,ro,lp,/[,=],aa,os,ed,uf,ig,dh,hj,tk,nl,s\\;,-',\\;z,qx,jc,kv,xb,bn,mm,w\\,,v.,z/,[-,]=,\"Q,<W,>E,PR,YT,FY,GU,CI,RO,LP,?{,+},AA,OS,ED,UF,IG,DH,HJ,TK,NL,S:,_\",:Z,QX,JC,KV,XB,BN,MM,W<,V>,Z?]]
)

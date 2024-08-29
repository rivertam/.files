vim.g.mapleader = " "
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>")
vim.keymap.set("n", "<leader>q", "<cmd>q<cr>")
vim.keymap.set("n", "<leader>h", "<C-w>h")
vim.keymap.set("n", "<leader>j", "<C-w>j")
vim.keymap.set("n", "<leader>k", "<C-w>k")
vim.keymap.set("n", "<leader>l", "<C-w>l")
vim.keymap.set("n", "<leader>=", "<C-w>=")
vim.keymap.set("n", "<leader>,", vim.cmd.nohlsearch)
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("i", "jw", "<Esc><cmd>w<cr>")
vim.keymap.set("i", "jq", "<Esc><cmd>wq<cr>")

vim.g.floaterm_keymap_new = "<C-p>"
vim.g.floaterm_keymap_next = "<C-]>"
vim.g.floaterm_keymap_prev = "<C-[>"
vim.g.floaterm_keymap_toggle = "<C-t>"

vim.keymap.set("n", "gd", vim.lsp.buf.definition)

vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)

vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)

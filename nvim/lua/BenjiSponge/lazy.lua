local lazypath = vim.fn.stdpath('data')..'/site/pack/packer/start/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({'git', 'clone',
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim",
    "--branch=stable",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { import = "BenjiSponge.plugins" },
  { import = "BenjiSponge.plugins.lsp" } })

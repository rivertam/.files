local opt = vim.opt

opt.nu = true

opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true

opt.smartindent = true
opt.smartcase = true
opt.ignorecase = true

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv('HOME') .. '/.vim/undodir'
opt.undofile = true

opt.incsearch = true

opt.termguicolors = true

opt.scrolloff = 8

opt.signcolumn = 'yes'
opt.isfname:append("@-@")
opt.cursorline = true

opt.updatetime = 50

-- Space is my leader key
vim.g.mapleader = ' '

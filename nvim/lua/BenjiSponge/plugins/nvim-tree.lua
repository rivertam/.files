return {
  "nvim-tree/nvim-tree.lua",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    local nvimtree = require("nvim-tree")

    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    nvimtree.setup({
      view = {
        width = 35,
      },

      renderer = {
        indent_markers = { enable = true },
      },

      git = {
        ignore = false,
      },
    })

    local keymap = vim.keymap

    keymap.set("n", "<leader>f", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer (on current file)" })
  end
}

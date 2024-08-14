return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.header.val = {
      "  .d8888b.                                               ",
      " d88P  Y88b                                              ",
      " Y88b.                                                   ",
      "  \"Y888b.   88888b.   .d88b.  88888b.   .d88b.   .d88b.  ",
      "     \"Y88b. 888 \"88b d88\"\"88b 888 \"88b d88P\"88b d8P  Y8b ",
      "       \"888 888  888 888  888 888  888 888  888 88888888 ",
      " Y88b  d88P 888 d88P Y88..88P 888  888 Y88b 888 Y8b.     ",
      "  \"Y8888P\"  88888P\"   \"Y88P\"  888  888  \"Y88888  \"Y8888  ",
      "            888                             888          ",
      "            888                        Y8b d88P          ",
      "            888                         \"Y88P\"           ",
    }


    dashboard.section.buttons.val = {
      dashboard.button("q", "> Quit NVIM", "<cmd>q<CR>"),
    }

    alpha.setup(dashboard.opts)

    vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])

  end,
}

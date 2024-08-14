vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)

  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    requires = { {'nvim-lua/plenary.nvim'} }
  } 

  use({
    'nyoom-engineering/oxocarbon.nvim',
    as = "oxocarbon",
    config = function()
      vim.cmd('colorscheme oxocarbon')
    end
  })

  use({
      "folke/trouble.nvim",
      config = function()
          require("trouble").setup {
              icons = false,
              -- your configuration comes here
              -- or leave it empty to use the default settings
              -- refer to the configuration section below
          }
      end
  })

  use("nvim-treesitter/nvim-treesitter-context");

  use({
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  })

  use({
    'nvim-treesitter/playground',
    run = ':TSUpdate'
  })

  use 'voldikss/vim-floaterm'

  use({
    'theprimeagen/harpoon'
  })

  use({
    'mbbill/undotree'
  })

  use({
    'tpope/vim-fugitive'
  })

  use({
    'nvim-tree/nvim-tree.lua'
  })

  use({
    'nvim-tree/nvim-web-devicons'
  })

  use {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({})
    end,
  }

  use {
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua" },
    config = function ()
      require("copilot_cmp").setup()
    end
  }

  -- Completion framework:
  use 'hrsh7th/nvim-cmp' 

  -- LSP completion source:
  use 'hrsh7th/cmp-nvim-lsp'

  -- Useful completion sources:
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-nvim-lsp-signature-help'
  use 'hrsh7th/cmp-vsnip'                             
  use 'hrsh7th/cmp-path'                              
  use 'hrsh7th/cmp-calc'                              
  use 'hrsh7th/cmp-buffer'                            
  use 'hrsh7th/vim-vsnip'   

  use 'neovim/nvim-lspconfig' 
  use 'simrat39/rust-tools.nvim'
  use({
    'jose-elias-alvarez/typescript.nvim',
    config = function()
      require('typescript').setup({})
    end
  })


  use 'williamboman/mason.nvim'    
  use 'williamboman/mason-lspconfig.nvim'

  use 'puremourning/vimspector'

  use 'MunifTanjim/prettier.nvim'
  use('jose-elias-alvarez/null-ls.nvim')

  use({
      "kylechui/nvim-surround",
      tag = "*", -- Use for stability; omit to use `main` branch for the latest features
      config = function()
          require("nvim-surround").setup({})
      end
  })

  use({'weilbith/nvim-code-action-menu',
      cmd = 'CodeActionMenu',
  })

  -- flutter / dart
  use({'natebosch/vim-lsc-dart'})
  use({'natebosch/vim-lsc'})
  use({'dart-lang/dart-vim-plugin'})

  -- markdown
  use({'godlygeek/tabular'})
  use({'preservim/vim-markdown'})
end)

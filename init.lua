require('coc-config')
require('options-config')
require('key-mappings-config')
require('plugins-custom-config')

return require('packer').startup(function()
  -- Packer plugin for packer :-}
  use 'wbthomason/packer.nvim'
  
  -- Plenary is used to implement asynchoronous corountines (used by other plugins)
  use 'nvim-lua/plenary.nvim'

  -- Plugins that provides floating panels and supports different extensions
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'}, { "kdheepak/lazygit.nvim" }  }
  }

  -- Coc Extension for Telescope plugin
  use 'fannheyward/telescope-coc.nvim'

  -- A pluging that will provide a start page for vim, with bookmars and Last Recent Used files
  use 'mhinz/vim-startify'

  -- A pluging for intellisense that support multiple language servers
  use { 'neoclide/coc.nvim', branch = 'release'}

  -- A style plugin for providing vscode look to nvim
  use 'Mofiqul/vscode.nvim'

  -- A Telescope extension for file browsing
  use {
      "nvim-telescope/telescope-file-browser.nvim",
      requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  }

  -- A pluging for allowing multiple copy and cycle pasting
  use 'gbprod/yanky.nvim'

  -- A pluging for commenting on almost any file and language
  use 'tpope/vim-commentary'

  -- A pluging for providing identation guides
  use 'lukas-reineke/indent-blankline.nvim'

  -- A toggable embedded terminal for nvim
  use {"akinsho/toggleterm.nvim", tag = '*'}

  -- Lazygit integration for nvim
  use "kdheepak/lazygit.nvim"

  -- Airline like statusline but configured in lua
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- Pluging for surrounding yanks with () "" '' and others
  use {
    "ur4ltz/surround.nvim",
    config = function()
      require"surround".setup {mappings_style = "surround"}
    end
  }

end)


require("coc-config")
require("options-config")
require("key-mappings-config")
require("plugins-custom-config")


local dap = require('dap')
dap.adapters.python = {
    type = 'executable',
    command = 'python',
    args = { '-m', 'debugpy.adapter' },
}

vim.fn.sign_define('DapBreakpoint', { text = '🛑', texthl = '', linehl = '', numhl = '' })
dap.configurations.python = {
    {
        -- The first three options are required by nvim-dap
        type = 'python', -- the type here established the link to the adapter definition: `dap.adapters.python`
        request = 'launch',
        name = "Launch file",

        -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

        program = "${file}", -- This configuration will launch the current file if used.
        pythonPath = function()
            -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
            -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
            -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
            return os.getenv("VIRTUAL_ENV") .. "/bin/python" or '/usr/bin/env python'
        end,
    },
}
require("neotest").setup({
    adapters = {
        require("neotest-python")({
            -- Extra arguments for nvim-dap configuration
            -- See https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for values
            dap = { justMyCode = false },
            -- Command line arguments for runner
            -- Can also be a function to return dynamic values
            args = { "--log-level", "DEBUG" },
            -- Runner to use. Will use pytest if available by default.
            -- Can be a function to return dynamic value.
            runner = "pytest"

        })
    }
})

return require("packer").startup(function()
    -- Packer plugin for packer :-}
    use "wbthomason/packer.nvim"

    -- Plenary is used to implement asynchoronous corountines (used by other plugins)
    use "nvim-lua/plenary.nvim"

    -- Plugins that provides floating panels and supports different extensions
    use {
        "nvim-telescope/telescope.nvim",
        requires = { { "nvim-lua/plenary.nvim" }, { "kdheepak/lazygit.nvim" },
            { "nvim-telescope/telescope-live-grep-args.nvim" } }
    }

    -- Coc Extension for Telescope plugin
    use "fannheyward/telescope-coc.nvim"
    use "smartpde/telescope-recent-files"

    -- A pluging that will provide a start page for vim, with bookmars and Last Recent Used files
    use "mhinz/vim-startify"
    use "tpope/vim-fugitive"

    -- required by other plugins, a tree visualizer
    use "nvim-treesitter/nvim-treesitter"

    use "nvim-neotest/neotest-python"
    -- tests plugin
    use {
        "nvim-neotest/neotest",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "antoinemadec/FixCursorHold.nvim"
        }
    }

    use "mfussenegger/nvim-dap"
    use "mfussenegger/nvim-dap-python"

    -- python tests

    -- A pluging for intellisense that support multiple language servers
    use { "neoclide/coc.nvim", branch = "release" }

    -- A style plugin for providing vscode look to nvim
    use "Mofiqul/vscode.nvim"

    -- A Telescope extension for file browsing
    use {
        "nvim-telescope/telescope-file-browser.nvim",
        requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    }

    -- A pluging for allowing multiple copy and cycle pasting
    use "gbprod/yanky.nvim"

    -- A pluging for commenting on almost any file and language
    use "tpope/vim-commentary"

    -- A pluging for providing identation guides
    use "lukas-reineke/indent-blankline.nvim"

    -- A toggable embedded terminal for nvim
    use { "akinsho/toggleterm.nvim", tag = "*" }

    -- Lazygit integration for nvim
    use "kdheepak/lazygit.nvim"

    -- Airline like statusline but configured in lua
    use {
        "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons", opt = true }
    }

    -- Pluging for surrounding yanks with () "" "" and others
    use {
        "ur4ltz/surround.nvim",
        config = function()
            require "surround".setup { mappings_style = "surround" }
        end
    }

    -- install without yarn or npm
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })

    use "thinca/vim-qfreplace"

    use {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end
    }
end)

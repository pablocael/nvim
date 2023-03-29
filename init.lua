require('basics')
require('colors')
require('coc-config')
require('lazygit.utils').project_root_dir()
local actions = require("telescope.actions")
require('telescope').setup{
  pickers = {
    find_files = {
      path_display = { "smart" },
      hidden = true
    },
  },
  defaults = {
    history = {
      path = '~/.local/share/nvim/databases/telescope_history.sqlite3',
      limit = 100,
    },
    mappings = {
      i = {
        ["<esc>"] = actions.close,
      },
    },
  },
  extensions = {
    coc = {
      theme = "ivy",
      prefer_locations = true, -- always use Telescope locations to preview definitions/declarations/implementations etc
    },
    file_browser = {
      theme = "ivy",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        ["i"] = {
          -- your custom insert mode mappings
        },
        ["n"] = {
          -- your custom normal mode mappings
        },
      },
    },
  },
}
require("toggleterm").setup{
  -- size can be a number or function which is passed the current terminal
  open_mapping = [[<c-\>]]
}
-- Lua:
-- For dark theme (neovim's default)
vim.o.background = 'dark'
-- For light theme
vim.o.background = 'light'

local c = require('vscode.colors').get_colors()
require('vscode').setup({
    -- Alternatively set style in setup
    style = 'dark'
})

require('vscode').load()

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

require('telescope').load_extension("fzf")
require('telescope').load_extension("coc")
require("telescope").load_extension("file_browser")
require("telescope").load_extension("lazygit")

local prefix = vim.env.XDG_CONFIG_HOME or vim.fn.expand("~/.config")
vim.opt.undodir = { prefix .. "/nvim/.undo//"}
vim.opt.autoread=true
vim.opt.backupdir = {prefix .. "/nvim/.backup//"}
vim.opt.directory = { prefix .. "/nvim/.swp//"}
vim.opt.undofile=true
vim.g.directory='$HOME/.config/nvim/swapfiles'
vim.opt.listchars = {eol = '↵', tab = '>=', trail = '.'}
vim.opt.list = true
vim.opt.number=true
vim.opt.relativenumber=true
vim.opt.clipboard = 'unnamedplus'

vim.g.latstatus=2
vim.g.mapleader = ","
vim.g.nofixendofline=true
vim.g.smarttab=true
vim.g.smartcase=true
vim.g.tabstop=4

vim.g.shiftwidth=4
vim.g.expandtab=true
vim.g.list=true
vim.g.background=dark
vim.g.cursorline=true
vim.g.cursorcolumn=true
vim.g.hidden=true

-- Key mappings
vim.api.nvim_set_keymap('n', '<esc><esc>', ':silent! nohls<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>x', ':bd<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>F', '<Plug>(coc-format)', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>o', ':Telescope buffers<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>rf', ':Rename <C-R>=expand("%")<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>df', ':GenDefinition<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>dc', ':GenDeclaration<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>b', ':Break<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>s', ':Step<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>fi', ':CocFix<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'gt', ':bnext<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'gT', ':bprev<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>e', ':Telescope coc diagnostics<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>t', ':TagbarToggle<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>m', ':Telescope file_browser<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>pl', ':ProjectList<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>k', ':DoShowMarks<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>tw', ':Tws<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>S', ':Startify <CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>ga', ':Git add %:p<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>gs', ':Telescope lazygit<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>gc', ':Git commit -v -q<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>gt', ':Git commit -v -q %:p<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>rn', '<Plug>(coc-rename)', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>gd', ':Git diff<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>gd', ':Git diff<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>gl', ':silent! Glog -- %<CR>:bot copen<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>gb', ':Git blame<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>gp', ':Git push<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>gP', ':Git pull<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>gh', ':Git browse<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<c-f>', ':Telescope find_files<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>a', ':Telescope live_grep<CR>', { noremap = true })
vim.api.nvim_set_keymap(
  "n",
  "<Leader>f<space>",
  ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
  { noremap = true }
)

-- make TAB and SHIFT + TAB to navigate between buffers in normal mode
vim.api.nvim_set_keymap('n', '<tab>', [[if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bn<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<s-tab>', [[if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bp<CR>]], {noremap = true, silent = true})

-- Appearance configurations
-- Change color of drop menu
vim.api.nvim_command('hi Pmenu ctermbg=darkgray ctermfg=white')

-- set current line color
vim.api.nvim_command('autocmd WinEnter * setlocal cursorline')
vim.api.nvim_command('autocmd WinLeave * setlocal nocursorline')
vim.api.nvim_command('highlight LineNr ctermfg=white ctermbg=236')
vim.api.nvim_command('highlight CursorColumn guibg=black ctermbg=234')
vim.api.nvim_command('highlight CursorLine guibg=black')
vim.api.nvim_command('highlight Normal ctermbg=233')

-- Keymapping configurations
vim.opt.nuw = 6
-- GoTo code navigation.
vim.api.nvim_set_keymap('n', 'gd', '<Plug>(coc-definition)', {silent = true})
vim.api.nvim_set_keymap('n', 'gy', '<Plug>(coc-type-definition)', {silent = true})
vim.api.nvim_set_keymap('n', 'gi', '<Plug>(coc-implementation)', {silent = true})
vim.api.nvim_set_keymap('n', 'gr', ':Telescope coc references<CR>', {silent = true})
vim.keymap.set({"n","x"}, "p", "<Plug>(YankyPutAfter)")
vim.keymap.set({"n","x"}, "P", "<Plug>(YankyPutBefore)")
vim.keymap.set("n", "<c-n>", "<Plug>(YankyCycleForward)")
vim.keymap.set("n", "<c-p>", "<Plug>(YankyCycleBackward)")

-- Use K to show documentation in preview window.
vim.api.nvim_set_keymap('n', 'K', ':call v:lua.show_documentation()<CR>', {silent = true})

function show_documentation()
if vim.bo.filetype == 'vim' or vim.bo.filetype == 'help' then
vim.cmd('h ' .. vim.fn.expand('<cword>'))
elseif vim.fn.exists(':CocActionAsync') == 2 and vim.fn'coc#rpc#ready' then
vim.fn.CocActionAsync('doHover')
else
vim.fn.execute('!' .. vim.bo.keywordprg .. ' ' .. vim.fn.expand('<cword>'))
end
end

-- CoC commands mappings
vim.api.nvim_set_keymap('n', '[g', '<Plug>(coc-diagnostic-prev)', {silent = true})
vim.api.nvim_set_keymap('n', ']g', '<Plug>(coc-diagnostic-next)', {silent = true})

function TrimWhitespace()
end

vim.api.nvim_create_user_command('Tws',
  function(opts)
    local save = vim.fn.winsaveview()
    vim.cmd('keeppatterns %s/\\s\\+$//e')
    vim.fn.winrestview(save)
  end,
  { nargs = 0 })

vim.cmd('highlight ExtraWhitespace ctermbg=red guibg=red')
vim.cmd('match ExtraWhitespace /\\s\\+$/')

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

require("yanky").setup({
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
})
require("telescope").load_extension("yank_history")

vim.g.startify_enable_special         = 0
vim.g.startify_enable_unsafe          = 1
vim.g.startify_files_number           = 15
vim.g.startify_relative_path          = 1
vim.g.startify_change_to_dir          = 1
vim.g.startify_change_to_vcs_root     = 1
vim.g.startify_session_persistence    = 1
vim.g.startify_session_delete_buffers = 1
vim.g.startify_session_dir            = '~/.config/nvim/session'
vim.g.startify_session_savevars       = { '&makeprg' }
vim.g.startify_bookmarks              = { '~/.config/nvim/init.lua', '~/development/arene-ai-sdk', '~/development/inadatron', '~/development/arene-ai-kubeflow' }
vim.g.startify_list_order             = {
      { '  Bookmarks:' },
      'bookmarks',
      { '  Sessions:' },
      'sessions',
      { '  Recent files:' },
      'files',
}

vim.g.startify_custom_indices = {}
for i = 0, 9 do
    table.insert(vim.g.startify_custom_indices, tostring(i))
end
for i = string.byte('A'), string.byte('Z') do
    table.insert(vim.g.startify_custom_indices, string.char(i))
end

vim.g.startify_custom_header = {
    '             ⠀⠀⠀⠀⣠⣶⡾⠏⠉⠙⠳⢦⡀⠀⠀⠀⢠⠞⠉⠙⠲⡀',
    '             ⠀⠀⠀⣴⠿⠏⠀⠀⠀⠀⠀⠀⢳⡀⠀⡏⠀⠀⠀⠀⠀⢷',
    '             ⠀⠀⢠⣟⣋⡀⢀⣀⣀⡀⠀⣀⡀⣧⠀⢸⠀⠀⠀⠀⠀ ⡇',
    '             ⠀⠀⢸⣯⡭⠁⠸⣛⣟⠆⡴⣻⡲⣿⠀⣸⠀⠀OK⠀ ⡇',
    '             ⠀⠀⣟⣿⡭⠀⠀⠀⠀⠀⢱⠀⠀⣿⠀⢹⠀⠀⠀⠀⠀ ⡇',
    '             ⠀⠀⠙⢿⣯⠄⠀⠀⠀⢀⡀⠀⠀⡿⠀⠀⡇⠀⠀⠀⠀⡼',
    '             ⠀⠀⠀⠀⠹⣶⠆⠀⠀⠀⠀⠀⡴⠃⠀⠀⠘⠤⣄⣠⠞',
    '             ⠀⠀⠀⠀⠀⢸⣷⡦⢤⡤⢤⣞⣁',
    '             ⠀⠀⢀⣤⣴⣿⣏⠁⠀⠀⠸⣏⢯⣷⣖⣦⡀',
    '             ⢀⣾⣽⣿⣿⣿⣿⠛⢲⣶⣾⢉⡷⣿⣿⠵⣿',
    '             ⣼⣿⠍⠉⣿⡭⠉⠙⢺⣇⣼⡏⠀⠀⠀⣄⢸',
    '             ⣿⣿⣧⣀⣿.........⣀⣰⣏⣘⣆⣀',
}

function s_sy_add_bookmark(bookmark)
    if not vim.g.startify_bookmarks then
        vim.g.startify_bookmarks = {}
    end
    table.insert(vim.g.startify_bookmarks, bookmark)
end

vim.cmd('command! -nargs=1 StartifyAddBookmark call v:lua.s_sy_add_bookmark(<q-args>)')

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'mhinz/vim-startify'
  use 'nvim-tree/nvim-tree.lua'
  use {
    'goolord/alpha-nvim',
    requires = { 'nvim-tree/nvim-web-devicons' },
    config = function ()
        require'alpha'.setup(require'alpha.themes.startify'.config)
    end
  }

  use 'nvim-lua/plenary.nvim'
  use { 'neoclide/coc.nvim', branch = 'release'}
  use 'Mofiqul/vscode.nvim'
  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
  }
  use {
      "nvim-telescope/telescope-file-browser.nvim",
      requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  }
  use 'nvim-telescope/telescope-smart-history.nvim'
  use 'gbprod/yanky.nvim'
  use 'kvrohit/rasmus.nvim'
  use 'nvim-treesitter/nvim-treesitter'
  use 'tpope/vim-commentary'
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'tpope/vim-fugitive'
  use {"akinsho/toggleterm.nvim", tag = '*'}

  use 'fannheyward/telescope-coc.nvim'
  use "kdheepak/lazygit.nvim"
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'}, { "kdheepak/lazygit.nvim" }  }
  }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  use {
    "ur4ltz/surround.nvim",
    config = function()
      require"surround".setup {mappings_style = "surround"}
    end
  }

end)


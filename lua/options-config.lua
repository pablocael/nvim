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
vim.opt.nuw = 6

vim.g.latstatus=2
vim.g.mapleader = ","
vim.g.nofixendofline=true
vim.g.smarttab=true
vim.g.smartcase=true
vim.opt.tabstop=4

vim.g.shiftwidth=4
vim.g.expandtab=true
vim.g.list=true
vim.g.background=dark
vim.g.cursorline=true
vim.g.cursorcolumn=true
vim.g.hidden=true

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

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
vim.cmd('highlight ExtraWhitespace ctermbg=red guibg=red')
vim.cmd('match ExtraWhitespace /\\s\\+$/')

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

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true


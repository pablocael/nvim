vim.api.nvim_set_keymap('n', '<esc><esc>', ':silent! nohls<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>S', ':Startify <CR>', { noremap = true, desc = "Toggle Startify Home Page" })
vim.api.nvim_set_keymap('n', '<Leader>x', ':bd<CR>', { noremap = true, desc = "Delete Current Buffer" })
vim.api.nvim_set_keymap('n', '<Leader>w', ':w<CR>', { noremap = true, desc = "Save Current Buffer" })
vim.api.nvim_set_keymap('n', '<Leader>ps', ':ProjectList<CR>', { noremap = true, desc = "Troggle Show Projects" })

-- File Group
vim.api.nvim_set_keymap('n', '<Leader>ff', ':Telescope find_files<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>fF', '<Plug>(coc-format)', { noremap = true, desc = "Format Code" })
vim.api.nvim_set_keymap('n', '<Leader>fg', ':lua require(\'telescope\').extensions.live_grep_args.live_grep_args()<CR>', { noremap = true, desc = "Grep content in Files" } )
vim.api.nvim_set_keymap('n', '<Leader>fb', ':Telescope buffers ignore_current_buffer=true sort_lastused=true<CR>', { noremap = true, desc="Current Buffers" })
vim.api.nvim_set_keymap('n', '<Leader>fs', ':Telescope file_browser path=%:p:h select_buffer=true<CR>', { noremap = true, desc = 'Toggle File Browser' }
)


-- Clear trailing spaces
vim.api.nvim_create_user_command('Tws',
  function(opts)
    local save = vim.fn.winsaveview()
    vim.cmd('keeppatterns %s/\\s\\+$//e')
    vim.fn.winrestview(save)
  end,
  { nargs = 0 }
)
vim.api.nvim_set_keymap('n', '<Leader>fw', ':Tws<CR>', { noremap = true, desc = "Trim White Spaces" })


-- Code group
vim.api.nvim_set_keymap('n', '<Leader>cd', ':Telescope coc diagnostics<CR>', { noremap = true, desc = "Code Diagnostics" })
vim.api.nvim_set_keymap('n', '<leader>cr', '<Plug>(coc-rename)', { noremap = true, desc = "Rename Symbol Under Cursor" } )
vim.api.nvim_set_keymap('n', 'cd', '<Plug>(coc-definition)', { silent = true, desc = "Go To Definition" } )
vim.api.nvim_set_keymap('n', 'cr', ':Telescope coc references<CR>', {silent = true, desc = "Find References"} )

-- Use k to show documentation in preview window.
function show_documentation()
  if vim.bo.filetype == 'vim' or vim.bo.filetype == 'help' then
  vim.cmd('h ' .. vim.fn.expand('<cword>'))
  elseif vim.fn.exists(':CocActionAsync') == 2 and vim.fn'coc#rpc#ready' then
  vim.fn.CocActionAsync('doHover')
  else
  vim.fn.execute('!' .. vim.bo.keywordprg .. ' ' .. vim.fn.expand('<cword>'))
  end
end

vim.api.nvim_set_keymap('n', 'ck', ':call v:lua.show_documentation()<CR>', {silent = true})

-- Git Group
vim.api.nvim_set_keymap('n', '<Leader>gs', ':Telescope lazygit<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>gd', ':Git diff<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>gd', ':Git diff<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>gb', ':Git blame<CR>', { noremap = true })

-- GoTo code navigation.
vim.keymap.set({"n","x"}, "p", "<Plug>(YankyPutAfter)")
vim.keymap.set({"n","x"}, "P", "<Plug>(YankyPutBefore)")
vim.keymap.set("n", "<c-n>", "<Plug>(YankyCycleForward)")
vim.keymap.set("n", "<c-p>", "<Plug>(YankyCycleBackward)")

-- CoC commands mappings
vim.api.nvim_set_keymap('n', '[g', '<Plug>(coc-diagnostic-prev)', {silent = true})
vim.api.nvim_set_keymap('n', ']g', '<Plug>(coc-diagnostic-next)', {silent = true})

vim.cmd([[
function!   QuickFixOpenAll()
    if empty(getqflist())
        return
    endif
    let s:prev_val = ""
    for d in getqflist()
        let s:curr_val = bufname(d.bufnr)
        if (s:curr_val != s:prev_val)
            exec "edit " . s:curr_val
        endif
        let s:prev_val = s:curr_val
    endfor
endfunction
]])
vim.api.nvim_set_keymap('n', '<leader>ka' , ':call QuickFixOpenAll()<CR>', { noremap=true, silent=false })
vim.api.nvim_set_keymap('n', '<leader>kr' , ':Qfreplace<CR>', { noremap=true, silent=false })

whichkey = require("which-key")
whichkey.register({
  f = {
    name = "File", -- optional group name
  },
  c = {
    name = "Code"
  },

  g = {
    name = "Git"
  },
}, { prefix = "<leader>" })

whichkey.setup()


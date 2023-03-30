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
vim.api.nvim_set_keymap("n", "<Leader>", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", { noremap = true } )
vim.api.nvim_set_keymap('n', '<C-r>', ':Qfreplace<CR>:Qfreplace<CR>', { noremap = true })
vim.api.nvim_set_keymap(
  "n",
  "<Leader>f<space>",
  ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
  { noremap = true }
)

-- GoTo code navigation.
vim.api.nvim_set_keymap('n', 'gd', '<Plug>(coc-definition)', {silent = true})
vim.api.nvim_set_keymap('n', 'gy', '<Plug>(coc-type-definition)', {silent = true})
vim.api.nvim_set_keymap('n', 'gi', '<Plug>(coc-implementation)', {silent = true})
vim.api.nvim_set_keymap('n', 'gr', ':Telescope coc references<CR>', {silent = true})
vim.api.nvim_set_keymap('n', '<C-k>', ':Telescope coc references<CR>', {silent = true})
vim.keymap.set({"n","x"}, "p", "<Plug>(YankyPutAfter)")
vim.keymap.set({"n","x"}, "P", "<Plug>(YankyPutBefore)")
vim.keymap.set("n", "<c-n>", "<Plug>(YankyCycleForward)")
vim.keymap.set("n", "<c-p>", "<Plug>(YankyCycleBackward)")

-- CoC commands mappings
vim.api.nvim_set_keymap('n', '[g', '<Plug>(coc-diagnostic-prev)', {silent = true})
vim.api.nvim_set_keymap('n', ']g', '<Plug>(coc-diagnostic-next)', {silent = true})

-- Use K to show documentation in preview window.
function show_documentation()
  if vim.bo.filetype == 'vim' or vim.bo.filetype == 'help' then
  vim.cmd('h ' .. vim.fn.expand('<cword>'))
  elseif vim.fn.exists(':CocActionAsync') == 2 and vim.fn'coc#rpc#ready' then
  vim.fn.CocActionAsync('doHover')
  else
  vim.fn.execute('!' .. vim.bo.keywordprg .. ' ' .. vim.fn.expand('<cword>'))
  end
end
vim.api.nvim_set_keymap('n', 'K', ':call v:lua.show_documentation()<CR>', {silent = true})


-- Clear trailing spaces
vim.api.nvim_create_user_command('Tws',
  function(opts)
    local save = vim.fn.winsaveview()
    vim.cmd('keeppatterns %s/\\s\\+$//e')
    vim.fn.winrestview(save)
  end,
  { nargs = 0 }
)
vim.api.nvim_set_keymap('n', '<Leader>tw', ':Tws<CR>', { noremap = true })

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

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<C-S-N>', ':tabp<CR>', opts)
vim.keymap.set('n', '<C-S-M>', ':tabn<CR>', opts)
vim.keymap.set('n', '<A-S-F>', ':LspZeroFormat<CR>', opts)
vim.keymap.set('n', '<C-Q>', ':q<CR>', opts)
vim.keymap.set('n', '<C-S-\\>', ':tabnew<CR>:terminal<CR>I', opts)
vim.keymap.set('i', '<C-C>', '<Esc>', opts)
vim.keymap.set('n', '<C-S-D>', ':cd %:p:h<CR>', opts)
vim.keymap.set('n', '<C-S>', ':w<CR>', opts)
vim.keymap.set('n', '<C-K>s', ':wa<CR>', opts)
vim.keymap.set('n', '<space>t', ':tabfind %:p:h<CR>', opts)
vim.keymap.set('n', '<C-S-S>', ':w<CR>:so<CR>', opts)
vim.keymap.set('n', '<C-S-Q>', ':qa!<CR>', opts)
vim.keymap.set('n', '<C-S-C>', '"+y', opts)
vim.keymap.set('n', '<space>e', ':Ex<CR><CR>', opts)
vim.keymap.set('n', '<space>s', ':vsplit<CR>', opts)
vim.keymap.set('n', '<C-A-O>', '<C-W>10<', opts)
vim.keymap.set('n', '<C-A-P>', '<C-W>10>', opts)

-- quick find
vim.keymap.set('n', '<C-Home>', ':find ~/.config/nvim/init.lua<CR>', opts)
vim.keymap.set('n', '<C-A-S>', ':find ~/.config/nvim/lua<CR>', opts)
vim.keymap.set('n', '<C-A-H>', ':find ~/Developer<CR>', opts)
vim.keymap.set('n', '<C-A-Home>', ':find ~/.config<CR>', opts)

-- terminal
vim.keymap.set('t', '<C-S-N>', '<C-\\><C-N>:tabp<CR>', opts)
vim.keymap.set('t', '<C-S-M>', '<C-\\><C-N>:tabn<CR>', opts)
vim.keymap.set('t', '<C-Q>', '<C-\\><C-N>:q<CR>', opts)

-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<space>w', builtin.find_files, {})
vim.keymap.set('n', '<space>fg', builtin.live_grep, {})
vim.keymap.set('n', '<space>fb', builtin.buffers, {})
vim.keymap.set('n', '<space>fh', builtin.help_tags, {})

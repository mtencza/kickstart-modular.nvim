------------------------------------- KEYMAPS ---------------------------------------
-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Center Cursor on Pg-Up/Pg-Down
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Scroll Up and Center' })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Scroll Down and Center' })

-- Delete all buffers except current
vim.keymap.set('n', '<leader>bd', function()
  vim.cmd '%bd|e#|bd#'
end, { desc = 'Deletes all buffers except current', noremap = true, silent = true })

-- Project view vim style
vim.keymap.set('n', '<leader>pv', ':Ex<CR>', { desc = 'Project Viewer' })

-- Print cur directory
vim.keymap.set('n', '<leader>pd', ':echo expand("%")<CR>', { desc = 'Current [D]irectory' })

-- Move highlighted area around
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '>-2<CR>gv=gv")

-- When pulling a line up, keep cursor at beginning of line
vim.keymap.set('n', 'J', 'mzJ`z')

-- When searching, keep cursor centered
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Change cur file to executable
vim.keymap.set('n', '<leader>x', ':!chmod +x %<CR>', { desc = 'Make E[X]ecutable' })

-- When highlighting->paste, shoot highlighted into void register and preserve paste register
-- vim.keymap.set('x', '<leader>p', '\"_dP')

------------------------------------- TIPS & TRICKS ---------------------------------------
-- <--- Control A --->
-- In vim command mode, <ctrl>+a will list out every possible auto complete for the text so far
-- This can be combined with <ctrl>+f to then search through that list, and then yank so you can
-- paste it in a new command

-- <--- Shift + s --->
-- This one nukes the current line and puts you in insert mode at the (properly indented) beginning
-- Serves as a replacement for dd + o

------------------------------------- AUTO COMMANDS ---------------------------------------
-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd('BufEnter', {
  desc = 'Disable New Line Comment',
  group = vim.api.nvim_create_augroup('disable-new-line-comment', { clear = true }),
  callback = function()
    vim.opt.formatoptions:remove { 'c', 'r', 'o' }
  end,
})

-- vim: ts=2 sts=2 sw=2 et
